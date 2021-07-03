import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:syntaxfm_app/models/error_message_model.dart';
import 'package:syntaxfm_app/models/show_model.dart';

class ShowRepository {
  static String _apiURL = 'https://syntax.fm/api/';

  final http.Client _client;

  ShowRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Show>> getAllShows() async {
    try {
      final response = await _client.get(Uri.parse('${_apiURL}shows'),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((e) => Show.fromJson(e))
            .toList();
      } else {
        throw const ErrorMessage(message: 'Something went wrong! - 1');
      }
    } catch (_) {
      throw const ErrorMessage(message: 'Something went wrong! - 2');
    }
  }
}
