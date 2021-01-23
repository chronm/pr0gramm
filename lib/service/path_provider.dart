import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;

class PathProvider {
  static Directory applicationDocumentsDirectory;

  static Future<void> init() async {
    applicationDocumentsDirectory = await path.getApplicationDocumentsDirectory();
  }
}
