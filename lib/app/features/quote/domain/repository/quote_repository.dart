import '../entitiies/qoute_entity.dart';

abstract class QuoteRepository {
  Future<Quote> getQuote();
}
