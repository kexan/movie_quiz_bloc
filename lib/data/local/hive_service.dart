import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/model/movie.dart';
import 'hive_boxes/movie_box.dart';

class HiveService {
  static Future<void> init() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(MovieAdapter());
      await MovieBox.openBox();
    } catch (e) {
      throw Exception("Error initializing Hive: ${e.toString()}");
    }
  }
}
