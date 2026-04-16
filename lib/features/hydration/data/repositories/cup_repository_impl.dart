import 'package:drift/drift.dart';
import 'package:hidroly/core/data/db/app_database.dart';
import 'package:hidroly/core/domain/exceptions/database_operation_exception.dart';
import 'package:hidroly/features/hydration/data/mappers/cup_mapper.dart';
import 'package:hidroly/features/hydration/domain/entities/cup.dart';
import 'package:hidroly/features/hydration/domain/repositories/cup_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cup_repository_impl.g.dart';

@riverpod
CupRepository cupRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return CupRepositoryImpl(appDatabase);
}

class CupRepositoryImpl implements CupRepository {
  final AppDatabase _database;

  const CupRepositoryImpl(this._database);

  @override
  Future<int> save(int value) async {
    return await _database.into(_database.cupsTable).insert(
      CupsTableCompanion(
        amount: Value(value),
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
  
  @override
  Future<List<Cup>> readAll() async {
    final data = await (_database.select(_database.cupsTable)).get();
    return [for(final cup in data) cup.toEntity()];
  }
  
  @override
  Future<Result<int>> delete(int id) async {
    try {
      return Success(await (_database.delete(_database.cupsTable)
        ..where((item) => item.id.equals(id)))
        .go());
    } catch (e) {
      return Failure(DatabaseOperationException());
    }
  }
}