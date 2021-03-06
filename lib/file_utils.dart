// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  final DateTime _now = DateTime.now();
  static Future<String?> get getFilePath async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  static Future<File> get getFile async {
    final DateTime _now = DateTime.now();
    final path = await getFilePath;
    return File('$path/${_now.year}${_now.month}${_now.hour}${_now.minute}.txt');
  }

  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    print(await getFile);
    return file.writeAsString(data);
  }

  static Future<String> readFiles() async {
    final file = await getFile;
    String data = '';
    if (file.existsSync()) {
      try {
        data = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }
    return data;
  }
}
