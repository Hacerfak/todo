// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SEs extends S {
  SEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Lista de Tareas';

  @override
  String get archivedTasksTitle => 'Tareas Archivadas';

  @override
  String get addTask => 'Añadir Tarea';

  @override
  String get editTask => 'Editar Tarea';

  @override
  String get taskTitleHint => 'Ingrese el título de la tarea...';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get selectedItems => 'seleccionados';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteSelected => 'Eliminar Seleccionados';

  @override
  String get archive => 'Archivar';

  @override
  String get archiveSelected => 'Archivar Seleccionados';

  @override
  String get viewArchived => 'Ver Archivados';

  @override
  String get archiveCompleted => 'Archivar Completadas';

  @override
  String get unarchive => 'Desarchivar';

  @override
  String get unarchiveSelected => 'Desarchivar Seleccionados';

  @override
  String get noTasks => '¡No hay tareas aquí todavía!';

  @override
  String get noArchivedTasks => 'No hay tareas archivadas.';

  @override
  String get confirmDelete => 'Confirmar Eliminación';

  @override
  String get confirmDeleteMessage =>
      '¿Está seguro de que desea eliminar las tareas seleccionadas?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';
}
