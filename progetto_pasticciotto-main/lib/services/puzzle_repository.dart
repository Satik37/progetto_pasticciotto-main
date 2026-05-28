import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/puzzle.dart';

class PuzzleRepository {
  final String localeCode;

  PuzzleRepository({required this.localeCode});

  Future<List<Puzzle>> _loadPuzzles(String fileName) async {
    final path = 'assets/data/$fileName';
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList
        .map((e) => Puzzle.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Puzzle>> loadLogicPuzzles() async {
    return _loadPuzzles('logic_puzzles_$localeCode.json');
  }

  Future<List<Puzzle>> loadHistoricalPuzzles() async {
    return _loadPuzzles('historical_puzzles_$localeCode.json');
  }
}