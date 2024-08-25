import 'dart:convert';

class Industry {
  final String name;
  Industry({
    required this.name,
  });

  Industry copyWith({
    String? name,
  }) {
    return Industry(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Industry.fromMap(Map<String, dynamic> map) {
    return Industry(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Industry.fromJson(String source) =>
      Industry.fromMap(json.decode(source));

  @override
  String toString() => 'Industry(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Industry && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
