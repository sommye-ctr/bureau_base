import 'dart:convert';

import 'package:bureau_base/models/industry.dart';
import 'package:bureau_base/models/user.dart';

class Employer {
  final String companyName;
  final String address;
  final User user;
  final Industry industry;
  Employer({
    required this.companyName,
    required this.address,
    required this.user,
    required this.industry,
  });

  Employer copyWith({
    String? companyName,
    String? address,
    User? user,
    Industry? industry,
  }) {
    return Employer(
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      user: user ?? this.user,
      industry: industry ?? this.industry,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'address': address,
      'user': user.toMap(),
      'industry': industry.toMap(),
    };
  }

  factory Employer.fromMap(Map<String, dynamic> map) {
    return Employer(
      companyName: map['company_name'] ?? '',
      address: map['address'] ?? '',
      user: User.fromMap(map['user']),
      industry: Industry.fromMap(map['industry']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employer.fromJson(String source) =>
      Employer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employer(companyName: $companyName, address: $address, user: $user, industry: $industry)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employer &&
        other.companyName == companyName &&
        other.address == address &&
        other.user == user &&
        other.industry == industry;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
        address.hashCode ^
        user.hashCode ^
        industry.hashCode;
  }
}
