import '../../domain/entitiies/qoute_entity.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.id,
    required super.text,
    required super.author,
    required super.category,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: DateTime.now().toIso8601String(),
      text: json['quote'],
      author: json['author'],
      category: json['category'],
    );
  }
}
