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
  String get deleteSelected => 'Delete Selected';

  @override
  String get archiveSelected => 'Archive Selected';

  @override
  String get viewArchived => 'View Archived';

  @override
  String get archiveCompleted => 'Archive Completed';

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
      'Are you sure you want to delete the selected items?';

  @override
  String get confirmDeleteSingleMessage =>
      'Are you sure you want to delete this task?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get aboutAppTitle => 'About the App';

  @override
  String get aboutAppTooltip => 'About the App';

  @override
  String get developerSubtitle => 'Developer';

  @override
  String get librariesUsed => 'Libraries Used';

  @override
  String get providerDescription =>
      'For simple and efficient state management.';

  @override
  String get googleAdsDescription => 'For monetization with AdMob ads.';

  @override
  String get sharedPrefsDescription => 'For data persistence on the device.';

  @override
  String get uuidDescription => 'To generate unique identifiers for each task.';

  @override
  String get intlDescription =>
      'For internationalization and localization (multi-language).';
}
