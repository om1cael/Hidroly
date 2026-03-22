import 'package:hidroly/features/hydration/domain/entities/cup.dart';

abstract class CupRepository {
  Future<int> save(Cup cup);
  Future<Cup?> read(int id);
}