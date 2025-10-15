// lib/screens/archived_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';
import '../l10n/l10n.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  void _showConfirmDialog(BuildContext context, VoidCallback onConfirm) {
    final local = S.of(context)!; // <-- CORREÇÃO AQUI
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(local.confirmDelete),
        content: Text(local.confirmDeleteMessage),
        actions: [
          TextButton(
            child: Text(local.no),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          TextButton(
            child: Text(local.yes),
            onPressed: () {
              onConfirm();
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final local = S.of(context)!; // <-- CORREÇÃO AQUI
    final archivedTasks = taskProvider.archivedTasks;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          taskProvider.isSelectionMode
              ? '${taskProvider.selectedTaskIds.length} ${local.selectedItems}'
              : local.archivedTasksTitle,
        ),
        actions: [
          if (taskProvider.isSelectionMode) ...[
            IconButton(
              icon: const Icon(Icons.unarchive),
              tooltip: local.unarchiveSelected,
              onPressed: taskProvider.unarchiveSelectedTasks,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: local.deleteSelected,
              onPressed: () =>
                  _showConfirmDialog(context, taskProvider.deleteSelectedTasks),
            ),
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => taskProvider.toggleSelectionMode(true),
            ),
          ],
        ],
      ),
      body: archivedTasks.isEmpty
          ? Center(child: Text(local.noArchivedTasks))
          : ListView.builder(
              itemCount: archivedTasks.length,
              itemBuilder: (context, index) {
                final task = archivedTasks[index];
                return TaskTile(
                  task: task,
                  onEdit: () {}, // Edição desabilitada para tarefas arquivadas
                );
              },
            ),
    );
  }
}
