import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../bag/strings.dart';

class HiveInitializer {
  static Future<void> initialize() async {
    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    Hive.init(dir!.path);
    await Hive.openBox(Strings.ids.coordinatesBox);
    await Hive.openBox(Strings.ids.profileBox);
  }
}
