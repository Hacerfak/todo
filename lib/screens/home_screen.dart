import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';
import '../widgets/adaptive_ad_banner.dart';
import 'archived_screen.dart';
import 'about_screen.dart';
import '../l10n/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showTaskDialog(BuildContext context, S local, {Task? task}) {
    final isEditing = task != null;
    final titleController = TextEditingController(
      text: isEditing ? task.title : '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final taskProvider = Provider.of<TaskProvider>(ctx, listen: false);
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isEditing ? local.editTask : local.addTask,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: local.taskTitleHint,
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) => _submitData(
                  ctx,
                  taskProvider,
                  titleController,
                  isEditing,
                  task,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text(local.cancel),
                  ),
                  ElevatedButton(
                    onPressed: () => _submitData(
                      ctx,
                      taskProvider,
                      titleController,
                      isEditing,
                      task,
                    ),
                    child: Text(local.save),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _submitData(
    BuildContext context,
    TaskProvider taskProvider,
    TextEditingController controller,
    bool isEditing,
    Task? task,
  ) {
    final title = controller.text;
    if (title.isNotEmpty) {
      if (isEditing) {
        taskProvider.editTask(task!.id, title);
        Navigator.of(context).pop();
      } else {
        taskProvider.addTask(title);
        controller.clear();
      }
    }
  }

  Future<bool> _showConfirmDialog(
    BuildContext context, {
    bool isSingleItem = false,
  }) async {
    final local = S.of(context)!;
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(local.confirmDelete),
        content: Text(
          isSingleItem
              ? local.confirmDeleteSingleMessage
              : local.confirmDeleteMessage,
        ),
        actions: [
          TextButton(
            child: Text(local.no),
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          TextButton(
            child: Text(local.yes),
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final local = S.of(context)!;
    final activeTasks = taskProvider.activeTasks;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          taskProvider.isSelectionMode
              ? '${taskProvider.selectedTaskIds.length} ${local.selectedItems}'
              : local.appTitle,
        ),
        actions: _buildAppBarActions(context, taskProvider, local),
      ),
      // O body agora contém apenas a lista, pois o banner foi movido.
      body: activeTasks.isEmpty
          ? Center(child: Text(local.noTasks))
          : ListView.builder(
              // Adicionamos um padding na parte inferior para garantir
              // que o FAB não cubra o último item ao rolar.
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: activeTasks.length,
              itemBuilder: (context, index) {
                final task = activeTasks[index];
                return Dismissible(
                  key: Key(task.id),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.blueAccent,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.archive, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      return await _showConfirmDialog(
                        context,
                        isSingleItem: true,
                      );
                    }
                    return true;
                  },
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      taskProvider.deleteTask(task.id);
                    } else {
                      taskProvider.archiveTask(task.id);
                    }
                  },
                  child: TaskTile(
                    task: task,
                    onEdit: () => _showTaskDialog(context, local, task: task),
                  ),
                );
              },
            ),
      // #### MUDANÇA APLICADA AQUI ####
      // Movemos o anúncio para a propriedade `bottomNavigationBar`.
      // O Scaffold gerencia o layout para nós automaticamente.
      bottomNavigationBar: const SafeArea(child: AdaptiveAdBannerWidget()),
      floatingActionButton: !taskProvider.isSelectionMode
          ? FloatingActionButton(
              onPressed: () => _showTaskDialog(context, local),
              tooltip: local.addTask,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  List<Widget> _buildAppBarActions(
    BuildContext context,
    TaskProvider provider,
    S local,
  ) {
    if (provider.isSelectionMode) {
      return [
        IconButton(
          icon: const Icon(Icons.archive),
          tooltip: local.archiveSelected,
          onPressed: provider.archiveSelectedTasks,
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: local.deleteSelected,
          onPressed: () async {
            final confirmed = await _showConfirmDialog(
              context,
              isSingleItem: false,
            );
            if (confirmed) {
              provider.deleteSelectedTasks();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => provider.toggleSelectionMode(false),
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: local.aboutAppTooltip,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.archive_outlined),
          tooltip: local.viewArchived,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ArchivedScreen()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.done_all),
          tooltip: local.archiveCompleted,
          onPressed: provider.archiveAllCompletedTasks,
        ),
      ];
    }
  }
}
