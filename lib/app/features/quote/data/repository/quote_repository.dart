import '../../domain/entitiies/qoute_entity.dart';
import '../../domain/repository/quote_repository.dart';
import '../data_sources/quote_remote_data_source.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource _quoteRemoteDataSource;

  QuoteRepositoryImpl({required QuoteRemoteDataSource quoteRemoteDataSource})
      : _quoteRemoteDataSource = quoteRemoteDataSource;
  @override
  Future<Quote> getQuote() {
    try {
      return _quoteRemoteDataSource.getQuote();
    } catch (e) {
      rethrow;
    }
  }
}
