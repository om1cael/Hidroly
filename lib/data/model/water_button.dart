class WaterButton {
  final int? id;
  final int amount;

  const WaterButton({
    this.id,
    required this.amount,
  });

  Map<String, Object?> toMap() {
    final map = {'amount': amount};
    if(id != null) {
      map['id'] = id as int;
    }

    return map;
  }

  WaterButton copyWith({int? id, int? amount}) {
    return WaterButton(
      id: id ?? this.id,
      amount: amount ?? this.amount,
    );
  }
}