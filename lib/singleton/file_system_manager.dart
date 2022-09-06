import 'dart:io';

import '../../util/app_common_stuffs/string_constants.dart';
import 'package:path_provider/path_provider.dart';

var fileSystemManager = FileSystemManager._singleton;

class FileSystemManager {
  static final FileSystemManager _singleton = FileSystemManager._internal();

  factory FileSystemManager() {
    return _singleton;
  }

  FileSystemManager._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile({required String fileName}) async {
    final path = await _localPath;
    return File(
      '$path/${StringConstant.prefixForSavingFile}_$fileName.txt',
    );
  }

  Future<File> writeFile({
    required String fileName,
    required dynamic content,
  }) async {
    final file = await _localFile(fileName: fileName);
    return file.writeAsBytes(content);
  }

  Future<int> readFile({required String fileName}) async {
    final file = await _localFile(fileName: fileName);

    final contents = await file.readAsString();

    return int.parse(contents);
  }
}
