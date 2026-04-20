import 'package:result_dart/result_dart.dart';

abstract class FileService {
  Future<void> saveSingleFile(String fileName, String content);
  Future<String> readSingleFile();
}