// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Progetto Pasticciotto';

  @override
  String get home => 'Home';

  @override
  String get genres => 'Generi';

  @override
  String get settings => 'Impostazioni';

  @override
  String get creditsAndSupport => 'Crediti e supporto';

  @override
  String get language => 'Lingua';

  @override
  String get getStarted => 'Inizia';

  @override
  String get backToHome => 'Torna alla home';

  @override
  String get chooseLanguage => 'Scegli la tua lingua';

  @override
  String get languagePageTitle => 'LINGUA';

  @override
  String get categoriesSubtitle => 'Esplora le storie cupe della tua mente.';

  @override
  String get categoriesTitle => 'Generi';

  @override
  String get categoriesFooter =>
      'Viaggiando nell\'universo in cerca di nuove storie...';

  @override
  String get logicPageTitle => 'Logica e Deduzione';

  @override
  String get logicPageSubtitle =>
      'Avventurati nell\'abisso: dove la logica incontra la follia.';

  @override
  String get historicalPageTitle => 'Narrativa Storica';

  @override
  String get historicalPageSubtitle =>
      'Echi dei caduti: le ore più oscure della storia reinventate.';

  @override
  String get showAnswer => 'Mostra risposta';

  @override
  String get hide => 'Nascondi';

  @override
  String get answerLabel => 'Risposta:';

  @override
  String errorLoadingPuzzles(Object error) {
    return 'Errore nel caricamento degli enigmi: $error';
  }

  @override
  String errorLoadingHistoricalPuzzles(Object error) {
    return 'Errore nel caricamento degli enigmi storici: $error';
  }
}
