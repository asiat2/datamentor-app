import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {

  static Future<void> markLessonComplete(String course, String lesson) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "$course-$lesson";
    await prefs.setBool(key, true);
  }

  static Future<bool> isLessonComplete(String course, String lesson) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "$course-$lesson";
    return prefs.getBool(key) ?? false;
  }

}