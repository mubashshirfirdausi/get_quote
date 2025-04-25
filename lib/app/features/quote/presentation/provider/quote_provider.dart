import '../../../../common/providers/loading_provider.dart';
import '../../domain/entitiies/qoute_entity.dart';
import '../../domain/usecases/get_quote_usecase.dart';

class QuotesProvider extends LoadingProvider {
  final GetQuoteUseCase _getQuoteUseCase;

  QuotesProvider({required GetQuoteUseCase getQuoteUseCase}) : _getQuoteUseCase = getQuoteUseCase;

  final List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  Future<void> getQuote() async {
    try {
      setLoading(true);
      final quote = await _getQuoteUseCase.execute();
      _quotes.add(quote);
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  void deleteQuote(String quoteId) {
    _quotes.removeWhere((element) => element.id == quoteId);
    notifyListeners();
  }

  Quote findQuoteById(String quoteId) {
    // currentQuote =
    return _quotes.firstWhere((element) => element.id == quoteId);
    // notifyListeners();
  }
}
