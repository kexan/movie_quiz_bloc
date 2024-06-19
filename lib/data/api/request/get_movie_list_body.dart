import 'package:flutter/cupertino.dart';

class GetMovieListBody {
  final String type;
  final int page;

  GetMovieListBody(this.type, this.page);

  Map<String, dynamic>? toApi() {
    return {
      'type': "TOP_250_MOVIES",
      'page': page.toString(),
    };
  }
}
