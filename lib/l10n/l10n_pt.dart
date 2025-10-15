// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class SPt extends S {
  SPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Lista de Tarefas';

  @override
  String get archivedTasksTitle => 'Tarefas Arquivadas';

  @override
  String get addTask => 'Adicionar Tarefa';

  @override
  String get editTask => 'Editar Tarefa';

  @override
  String get taskTitleHint => 'Digite o título da tarefa...';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get selectedItems => 'selecionados';

  @override
  String get delete => 'Excluir';

  @override
  String get deleteSelected => 'Excluir Selecionados';

  @override
  String get archive => 'Arquivar';

  @override
  String get archiveSelected => 'Arquivar Selecionados';

  @override
  String get viewArchived => 'Ver Arquivados';

  @override
  String get archiveCompleted => 'Arquivar Concluídas';

  @override
  String get unarchive => 'Desarquivar';

  @override
  String get unarchiveSelected => 'Desarquivar Selecionados';

  @override
  String get noTasks => 'Nenhuma tarefa por aqui!';

  @override
  String get noArchivedTasks => 'Nenhuma tarefa arquivada.';

  @override
  String get confirmDelete => 'Confirmar Exclusão';

  @override
  String get confirmDeleteMessage =>
      'Você tem certeza que deseja excluir as tarefas selecionadas?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';
}
