// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Progetto Pasticciotto';

  @override
  String get home => 'Home';

  @override
  String get genres => 'Genres';

  @override
  String get settings => 'Settings';

  @override
  String get creditsAndSupport => 'Credits and Support';

  @override
  String get language => 'Language';

  @override
  String get getStarted => 'Get Started';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get chooseLanguage => 'Choose your language';

  @override
  String get languagePageTitle => 'LANGUAGE';

  @override
  String get categoriesSubtitle => 'Explore the grim stories of your mind.';

  @override
  String get categoriesTitle => 'Genres';

  @override
  String get categoriesFooter => 'Traveling the universe for new tales...';

  @override
  String get logicPageTitle => 'Logic and Deduction';

  @override
  String get logicPageSubtitle =>
      'Venture into the abyss: where logic meets lunacy.';

  @override
  String get historicalPageTitle => 'Historical Fiction';

  @override
  String get historicalPageSubtitle =>
      'Echoes of the fallen: history\'s darkest hours reimagined.';

  @override
  String get showAnswer => 'Show Answer';

  @override
  String get hide => 'Hide';

  @override
  String get answerLabel => 'Answer:';

  @override
  String errorLoadingPuzzles(Object error) {
    return 'Error loading puzzles: $error';
  }

  @override
  String errorLoadingHistoricalPuzzles(Object error) {
    return 'Error loading historical puzzles: $error';
  }
}
