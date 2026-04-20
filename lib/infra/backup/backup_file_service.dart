import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hidroly/core/domain/interfaces/file_service.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_file_service.g.dart';

@riverpod
FileService backupFileService(Ref ref) {
  return BackupFileService();
}

class BackupFileService implements FileService {
  @override
  Future<String?> saveSingleFile(String fileName, String content) async {
    final fileBytes = utf8.encode(content);

    final outputFile = await FilePicker.saveFile(
      bytes: fileBytes,
      fileName: fileName,
    );

    return outputFile;
  }
}