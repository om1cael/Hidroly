import 'package:drift/drift.dart';

class FakeSqlUser extends QueryExecutorUser {
  @override
  int get schemaVersion => 3;
  
  @override
  Future<void> beforeOpen(QueryExecutor executor, OpeningDetails details) async {}
}