import 'package:hidroly/features/hydration/domain/entities/cup.dart';

abstract class CupRepository {
  Future<int> save(int value);
  Future<Cup?> read(int id);
  Future<List<Cup>> readAll();
}