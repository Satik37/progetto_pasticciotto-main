import 'package:flutter_test/flutter_test.dart';
import 'package:sushi/services/puzzle_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('loads English logic puzzles from assets', () async {
    final puzzles = await PuzzleRepository(localeCode: 'en').loadLogicPuzzles();

    expect(puzzles, isNotEmpty);
    expect(puzzles.first.title, isNotEmpty);
    expect(puzzles.first.description, isNotEmpty);
  });

  test('loads English historical puzzles from assets', () async {
    final puzzles = await PuzzleRepository(localeCode: 'en').loadHistoricalPuzzles();

    expect(puzzles, isNotEmpty);
    expect(puzzles.first.title, isNotEmpty);
    expect(puzzles.first.description, isNotEmpty);
  });
}
