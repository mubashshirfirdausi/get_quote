import '../../../../common/usecase/usecase.dart';
import '../entitiies/qoute_entity.dart';
import '../repository/quote_repository.dart';

class GetQuoteUseCase implements Usecase<Future<Quote>> {
  final QuoteRepository _quoteRepository;

  GetQuoteUseCase({required QuoteRepository quoteRepository}) : _quoteRepository = quoteRepository;

  @override
  Future<Quote> execute() async {
    try {
      return _quoteRepository.getQuote();
    } catch (e) {
      rethrow;
    }
  }
}
