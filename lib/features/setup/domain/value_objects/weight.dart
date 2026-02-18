class Weight {
  final int kg;

  const Weight({required this.kg});

  factory Weight.fromLb(int lb) {
    int kg = (lb / 2.205).round();
    return Weight(kg: kg);
  }
}