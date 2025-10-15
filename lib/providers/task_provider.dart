// lib/providers/task_provider.dart
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  final List<String> _selectedTaskIds = [];
  bool _isSelectionMode = false;
  final Uuid _uuid = const Uuid();

  static const _tasksKey = 'tasks_list_key';

  TaskProvider() {
    loadTasks();
  }

  // Getters
  List<Task> get activeTasks =>
      _tasks.where((task) => !task.isArchived).toList();
  List<Task> get archivedTasks =>
      _tasks.where((task) => task.isArchived).toList();
  List<String> get selectedTaskIds => _selectedTaskIds;
  bool get isSelectionMode => _isSelectionMode;

  // Persistência
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasksJson = _tasks
        .map((task) => jsonEncode(task.toJson()))
        .toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksData = prefs.getStringList(_tasksKey);
    if (tasksData != null) {
      _tasks = tasksData
          .map((taskJson) => Task.fromJson(jsonDecode(taskJson)))
          .toList();
      notifyListeners();
    }
  }

  // Ações CRUD
  void addTask(String title) {
    final newTask = Task(id: _uuid.v4(), title: title);
    _tasks.add(newTask);
    notifyListeners();
    _saveTasks();
  }

  void editTask(String id, String newTitle) {
    try {
      final task = _tasks.firstWhere((task) => task.id == id);
      task.title = newTitle;
      notifyListeners();
      _saveTasks();
    } catch (e) {
      // Tratar erro se a tarefa não for encontrada
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
    _saveTasks();
  }

  void toggleDone(String id) {
    try {
      final task = _tasks.firstWhere((task) => task.id == id);
      task.isDone = !task.isDone;
      notifyListeners();
      _saveTasks();
    } catch (e) {
      // Tratar erro
    }
  }

  // NOVA FUNÇÃO para arquivar uma única tarefa
  void archiveTask(String id) {
    try {
      final task = _tasks.firstWhere((task) => task.id == id);
      task.isArchived = true;
      task.isDone = true;
      notifyListeners();
      _saveTasks();
    } catch (e) {
      // Tratar erro
    }
  }

  // Ações em Lote
  void toggleSelectionMode(bool isArchivedScreen) {
    _isSelectionMode = !_isSelectionMode;
    if (!_isSelectionMode) {
      _selectedTaskIds.clear();
    }
    notifyListeners();
  }

  void toggleTaskSelection(String id) {
    if (_selectedTaskIds.contains(id)) {
      _selectedTaskIds.remove(id);
    } else {
      _selectedTaskIds.add(id);
    }
    if (_selectedTaskIds.isEmpty) {
      _isSelectionMode = false;
    }
    notifyListeners();
  }

  void _clearSelection() {
    _isSelectionMode = false;
    _selectedTaskIds.clear();
    notifyListeners();
  }

  void deleteSelectedTasks() {
    _tasks.removeWhere((task) => _selectedTaskIds.contains(task.id));
    _clearSelection();
    _saveTasks();
  }

  void archiveSelectedTasks() {
    for (var task in _tasks) {
      if (_selectedTaskIds.contains(task.id)) {
        task.isArchived = true;
        task.isDone = true; // Tarefas arquivadas são consideradas concluídas
      }
    }
    _clearSelection();
    _saveTasks();
  }

  void unarchiveSelectedTasks() {
    for (var task in _tasks) {
      if (_selectedTaskIds.contains(task.id)) {
        task.isArchived = false;
      }
    }
    _clearSelection();
    _saveTasks();
  }

  void archiveAllCompletedTasks() {
    for (var task in _tasks) {
      if (!task.isArchived && task.isDone) {
        task.isArchived = true;
      }
    }
    notifyListeners();
    _saveTasks();
  }
}
