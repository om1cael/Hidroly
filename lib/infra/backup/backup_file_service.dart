import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:hidroly/core/domain/interfaces/file_service.dart';
import 'package:result_dart/result_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_file_service.g.dart';

@riverpod
FileService backupFileService(Ref ref) {
  return BackupFileService();
}

class BackupFileService implements FileService {
  @override
  Future<Result<String>> saveSingleFile(String fileName, String content) async {
    try {
      final fileBytes = utf8.encode(content);
      
      final outputFile = await FilePicker.saveFile(
        bytes: fileBytes,
        fileName: fileName,
      );
      
      return outputFile != null
        ? Success(outputFile)
        : Success('');
    } on Exception catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
  
  @override
  Future<Result<String>> readSingleFile() async {
    try {
      final pickResult = await FilePicker.pickFiles(
        allowMultiple: false,
        type: .custom,
        allowedExtensions: ['json'],
      );
      
      if(pickResult == null) return Success('');

      final file = File(pickResult.files.single.path!);
      final fileContent = await file.readAsString();
      
      return Success(fileContent);
    } on Exception catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}