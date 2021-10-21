// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String?> get getFilePath async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    print(File('$path/${DateTime.now()}.txt'));
    return File('$path/${DateTime.now()}.txt');
  }

  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data);
  }
}