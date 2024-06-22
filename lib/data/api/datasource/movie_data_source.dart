import 'package:dio/dio.dart';

import '../model/movielist/api_movie_list.dart';

class MovieDataSource {
  static const baseUrl = "https://kinopoiskapiunofficial.tech/";
  static const apiToken = "6624381e-f39e-497f-b02c-9dd0ce8cd08b";
  static const apiToken2 = "de712c0d-38ae-4079-bacc-5ed1596c2d65";

  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiMovieList> getMovieListFromApi({required int page}) async {
    try {
      final response = await dio.get(
        "/api/v2.2/films/collections",
        queryParameters: {
          "type": "TOP_250_MOVIES",
          "page": page.toString(),
        },
        options: Options(
          headers: {
            "X-API-KEY": apiToken2,
          },
        ),
      );
      return ApiMovieList.fromJson(response.data);
    } catch (e) {
      throw Exception("fetching error $e");
    }
  }
}
