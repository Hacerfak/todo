// lib/widgets/task_tile.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit; // Callback para edição

  const TaskTile({super.key, required this.task, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    // Usamos um Consumer para reconstruir apenas este widget quando necessário
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        final bool isSelected = taskProvider.selectedTaskIds.contains(task.id);

        return ListTile(
          onLongPress: () {
            if (!taskProvider.isSelectionMode) {
              taskProvider.toggleSelectionMode(task.isArchived);
              taskProvider.toggleTaskSelection(task.id);
            }
          },
          onTap: () {
            if (taskProvider.isSelectionMode) {
              taskProvider.toggleTaskSelection(task.id);
            } else {
              // Em vez de editar, vamos marcar como concluída com um toque
              taskProvider.toggleDone(task.id);
            }
          },
          leading: Checkbox(
            value: taskProvider.isSelectionMode ? isSelected : task.isDone,
            onChanged: (_) {
              if (taskProvider.isSelectionMode) {
                taskProvider.toggleTaskSelection(task.id);
              } else {
                taskProvider.toggleDone(task.id);
              }
            },
            activeColor: Theme.of(context).primaryColor,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: !taskProvider.isSelectionMode && task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: !taskProvider.isSelectionMode && task.isDone
                  ? Colors.grey
                  : null,
            ),
          ),
          trailing: taskProvider.isSelectionMode
              ? null
              : IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: onEdit, // Chama a função de edição passada
                ),
          tileColor: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : null,
        );
      },
    );
  }
}
