import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:result_dart/result_dart.dart';

abstract class CupRepository {
  Future<int> save(int value);
  Future<Cup?> read(int id);
  Future<List<Cup>> readAll();
  Future<Result<int>> delete(int id);
}