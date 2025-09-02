import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_fiap25/common/constants.dart';
import 'package:movie_app_fiap25/models/movie_model.dart';

class MovieServices {
  final baseUrl = 'https://api.themoviedb.org/3/';
  final key = '?api_key=$apiKey';

  Future<Result> getTopRatedMovies() async {
    var endPoint = 'movie/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load top rated movies');
  }
}
