import 'package:hive/hive.dart';

import '../../../domain/model/movie.dart';

class MovieBox {
  static const String _boxName = 'movies';

  static Future<Box<Movie>> openBox() async {
    return await Hive.openBox<Movie>(_boxName);
  }

  static Box<Movie> getBox() {
    return Hive.box<Movie>(_boxName);
  }
}
