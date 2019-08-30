import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future getAppDocDir(dir) async {
  Directory appDocRoot = await getApplicationDocumentsDirectory();
  return Directory(p.join(appDocRoot.path, dir)).create(recursive: true);
}
