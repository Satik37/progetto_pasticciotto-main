class Puzzle {
  final String id;
  final String categoryId;
  final String imagePath;
  final String title;
  final String description;
  final String answer;

  const Puzzle({
    required this.id,
    required this.categoryId,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.answer,
  });

  factory Puzzle.fromJson(Map<String, dynamic> json) {
    return Puzzle(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      imagePath: json['imagePath'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'imagePath': imagePath,
      'title': title,
      'description': description,
      'answer': answer,
    };
  }
}