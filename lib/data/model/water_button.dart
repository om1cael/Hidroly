class WaterButton {
  final int? id;
  final int amount;
  final int? position;

  const WaterButton({
    this.id,
    required this.amount,
    this.position,
  });

  Map<String, Object?> toMap() {
    final map = {'amount': amount};
    
    if(id != null) {
      map['id'] = id as int;
    }

    if(position != null) {
      map['position'] = position as int;
    }
    
    return map;
  }

  WaterButton copyWith({int? id, int? amount, int? position}) {
    return WaterButton(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      position: position ?? this.position,
    );
  }

  @override
  String toString() {
    return '$id : $amount : $position';
  }
}