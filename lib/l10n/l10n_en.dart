// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'To-Do List';

  @override
  String get archivedTasksTitle => 'Archived Tasks';

  @override
  String get addTask => 'Add Task';

  @override
  String get editTask => 'Edit Task';

  @override
  String get taskTitleHint => 'Enter task title...';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get selectedItems => 'selected';

  @override
  String get delete => 'Delete';

  @override
  String get deleteSelected => 'Delete Selected';

  @override
  String get archive => 'Archive';

  @override
  String get archiveSelected => 'Archive Selected';

  @override
  String get viewArchived => 'View Archived';

  @override
  String get archiveCompleted => 'Archive Completed';

  @override
  String get unarchive => 'Unarchive';

  @override
  String get unarchiveSelected => 'Unarchive Selected';

  @override
  String get noTasks => 'No tasks here yet!';

  @override
  String get noArchivedTasks => 'No archived tasks.';

  @override
  String get confirmDelete => 'Confirm Deletion';

  @override
  String get confirmDeleteMessage =>
      'Are you sure you want to delete the selected tasks?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';
}
