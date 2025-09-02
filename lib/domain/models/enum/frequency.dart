enum Frequency {
  every15Minutes(15),
  every30Minutes(30),
  everyHour(60),
  every2Hours(120),
  every3Hours(180),
  every4Hours(240);

  const Frequency(this.frequency);
  final int frequency;

  static Frequency getFrequency(int minutes) {
    return Frequency
      .values
      .where((value) => value.frequency == minutes)
      .first;
  }
}