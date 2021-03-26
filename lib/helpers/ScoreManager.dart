import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ScoreManager {
  static int currentScore = 0;
  static int bestScore = 0;

  static void resetScore() {
    currentScore = 0;
  }

  static Future<void> increment() async {
    currentScore++;
    if (currentScore > bestScore) {
      await saveBestScore('$currentScore');
    }
  }

  static Future<void> initBestScore() async {
    bestScore = await readBestScore();
  }

  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/bestScore.txt');
  }

  static Future<void> saveBestScore(String data) async {
    final file = await getFile;
    bestScore = int.parse(data);
    return file.writeAsString(data);
  }

  static Future<int> readBestScore() async {
    final file = await getFile;
    try {
      String fileContent = await file.readAsString();
      if (fileContent.isEmpty) {
        return 0;
      }
      return int.parse(fileContent);
    } catch (e) {
      file.create();
      return 0;
    }
  }
}
