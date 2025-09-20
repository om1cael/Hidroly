import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/data/repository/summary_repository.dart';
import 'package:hidroly/ui/summary/view_models/summary_global_stats_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockSummaryRepository extends Mock implements SummaryRepository {}

void main() {
  late MockSummaryRepository mockSummaryRepository;
  late SummaryGlobalStatsViewModel viewModel;

  setUp(() {
    mockSummaryRepository = MockSummaryRepository();
    viewModel = SummaryGlobalStatsViewModel(summaryRepository: mockSummaryRepository);
  });

  test('Global stats load with random data', () async {
    when(() => mockSummaryRepository.getStreak()).thenAnswer((_) async => 0);
    when(() => mockSummaryRepository.getBestStreak()).thenAnswer((_) async => 0);
    when(() => mockSummaryRepository.getTotalIntake()).thenAnswer((_) async => 0);
    when(() => mockSummaryRepository.getAverageIntake()).thenAnswer((_) async => 0);

    bool result = await viewModel.loadGlobalStatistics();

    expect(result, true);
    expect(viewModel.globalStatistic?.currentStreak, 0);
    expect(viewModel.globalStatistic?.bestStreak, 0);
    expect(viewModel.globalStatistic?.totalIntake, 0);
    expect(viewModel.globalStatistic?.averageIntake, 0);
  });

  test('Returns false on failure', () async {
    when(() => mockSummaryRepository.getStreak()).thenThrow(Exception());

    bool result = await viewModel.loadGlobalStatistics();

    expect(result, false);
  });
}