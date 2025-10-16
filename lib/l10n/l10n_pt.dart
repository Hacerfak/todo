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
  String get deleteSelected => 'Excluir Selecionados';

  @override
  String get archiveSelected => 'Arquivar Selecionados';

  @override
  String get viewArchived => 'Ver Arquivados';

  @override
  String get archiveCompleted => 'Arquivar Concluídas';

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
      'Você tem certeza que deseja excluir os itens selecionados?';

  @override
  String get confirmDeleteSingleMessage =>
      'Você tem certeza que deseja excluir esta tarefa?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get aboutAppTitle => 'Sobre o App';

  @override
  String get aboutAppTooltip => 'Sobre o App';

  @override
  String get developerSubtitle => 'Desenvolvedor';

  @override
  String get librariesUsed => 'Bibliotecas Utilizadas';

  @override
  String get providerDescription =>
      'Para um gerenciamento de estado simples e eficiente.';

  @override
  String get googleAdsDescription => 'Para monetização com anúncios do AdMob.';

  @override
  String get sharedPrefsDescription =>
      'Para persistência de dados no dispositivo.';

  @override
  String get uuidDescription =>
      'Para gerar identificadores únicos para cada tarefa.';

  @override
  String get intlDescription =>
      'Para internacionalização e localização (multi-idioma).';
}
