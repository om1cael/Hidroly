class WaterButton {
  final int? id;
  final int amount;
  final bool isCustomOption;

  const WaterButton({
    this.id,
    required this.amount,
    this.isCustomOption = false,
  });

  Map<String, Object?> toMap() {
    final map = {'amount': amount};
    if(id != null) {
      map['id'] = id as int;
    };

    return map;
  }
}