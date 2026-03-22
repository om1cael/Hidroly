import 'package:hidroly/features/hydration/domain/entities/cup.dart';

abstract class CupRepository {
  Future<int> save(int dayId, int value);
  Future<Cup?> read(int id);
  Future<List<Cup>> readAll(int dayId);
}