import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/features/hydration/data/mappers/cup_mapper.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:hidroly/features/hydration/domain/repositories/cup_repository.dart';

class CupsRepositoryImpl implements CupRepository {
  final AppDatabase _database;

  const CupsRepositoryImpl(this._database);

  @override
  Future<int> save(Cup cup) async {
    return await _database.into(_database.cupsTable).insert(
      CupsTableCompanion(
        day: Value(cup.dayId),
        amount: Value(cup.amount),
      ),
    );
  }

  @override
  Future<Cup?> read(int id) async {
    final data = await (_database.select(_database.cupsTable)
      ..where((cup) => cup.id.equals(id)))
      .getSingleOrNull();
    
    return data?.toEntity();
  }
}