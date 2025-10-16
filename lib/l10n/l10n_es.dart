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
  String get deleteSelected => 'Eliminar Seleccionados';

  @override
  String get archiveSelected => 'Archivar Seleccionados';

  @override
  String get viewArchived => 'Ver Archivados';

  @override
  String get archiveCompleted => 'Archivar Completadas';

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
      '¿Está seguro de que desea eliminar los elementos seleccionados?';

  @override
  String get confirmDeleteSingleMessage =>
      '¿Está seguro de que desea eliminar esta tarea?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get aboutAppTitle => 'Acerca de la App';

  @override
  String get aboutAppTooltip => 'Acerca de la App';

  @override
  String get developerSubtitle => 'Desarrollador de la Aplicación';

  @override
  String get librariesUsed => 'Bibliotecas Utilizadas';

  @override
  String get providerDescription =>
      'Para una gestión de estado simple y eficiente.';

  @override
  String get googleAdsDescription => 'Para monetización con anuncios de AdMob.';

  @override
  String get sharedPrefsDescription =>
      'Para la persistencia de datos en el dispositivo.';

  @override
  String get uuidDescription =>
      'Para generar identificadores únicos para cada tarea.';

  @override
  String get intlDescription =>
      'Para internacionalización y localización (multi-idioma).';
}
