import 'package:flutter_test/flutter_test.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:intl/intl.dart';

void main() {
  group('Test normalized local', () {
    test('Returns zero-hour normalized local if UTC', () {
      final supernova = DateTime.utc(
        2024, 6, 11, 21, 0,
      );

      final normalized = AppDateUtils.normalizedLocal(supernova);

      expect(normalized.isUtc, false);
      expect(normalized.hour, 0);
      expect(normalized.minute, 0);

      final localSupernova = supernova.toLocal();
      expect(normalized.year, localSupernova.year);
      expect(normalized.month, localSupernova.month);
      expect(normalized.day, localSupernova.day);
    });

    test('Returns zero-hour normalized local', () {
      final supernova = DateTime(
        2024, 6, 11, 21, 0,
      );

      final normalized = AppDateUtils.normalizedLocal(supernova);
      expect(normalized, DateTime(2024, 6, 11, 0, 0));
    });
  });

  group('Title formatting works', () {
    final fakeNow = DateTime(2021, 1, 12);

    test('Returns default today text if no custom is provided', () {
      final formattedTitle = AppDateUtils.formatDayTitle(fakeNow, now: fakeNow);
      expect(formattedTitle, 'Today');
    });

    test('Returns custom today text', () {
      final customTodayText = 'TestText';

      final formattedTitle = AppDateUtils.formatDayTitle(fakeNow, now: fakeNow, todayText: customTodayText);
      expect(formattedTitle, customTodayText);
    });

    test('Returns formatted date if not today', () {
      final supernova = DateTime(2024, 6, 11);

      final formattedTitle = AppDateUtils.formatDayTitle(supernova, now: fakeNow);
      expect(formattedTitle, DateFormat.yMMMMd().format(supernova));
    });
  });
}