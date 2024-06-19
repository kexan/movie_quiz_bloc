import 'package:dio/dio.dart';
import 'package:movie_quiz_bloc/data/api/request/get_movie_list_body.dart';

import '../model/movielist/api_movie_list.dart';
class MovieDataService {
  static const baseUrl = "https://kinopoiskapiunofficial.tech/api";
  static const apiToken = "6624381e-f39e-497f-b02c-9dd0ce8cd08b";

  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiMovieList> getMovieList({required GetMovieListBody body}) async {
    final response = await dio.get(
      "/api/v2.2/films/collections",
      queryParameters: {
        "type": body.type,
        "page": body.page.toString(),
      },
      options: Options(
        headers: {
          "X-API-KEY": apiToken,
        },
      ),
    );
    if (response.statusCode == 200) {
      return apiMovieListFromJson(response.data);
    }
    throw Exception("fetching error");
  }
}
