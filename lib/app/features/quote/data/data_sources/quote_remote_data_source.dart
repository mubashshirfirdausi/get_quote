import 'dart:convert';
import '../../../../common/constants/endpoints.dart';

import '../../../../common/constants/api_key.dart';
import 'package:http/http.dart' as http;

import '../models/quote_model.dart';

class QuoteRemoteDataSource {
  Future<QuoteModel> getQuote() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.getQouteUrl), headers: {
        'X-Api-Key': apiKey,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return QuoteModel.fromJson(data[0]);
      } else {
        throw 'Failed to load quote';
      }
    } catch (e) {
      rethrow;
    }
  }
}
