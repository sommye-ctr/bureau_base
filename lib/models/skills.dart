import 'dart:convert';

class Skills {
  final String name;
  Skills({
    required this.name,
  });

  Skills copyWith({
    String? name,
  }) {
    return Skills(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Skills.fromMap(Map<String, dynamic> map) {
    return Skills(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Skills.fromJson(String source) => Skills.fromMap(json.decode(source));

  @override
  String toString() => 'Skills(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Skills && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
