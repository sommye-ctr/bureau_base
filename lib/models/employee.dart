import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:bureau_base/models/industry.dart';
import 'package:bureau_base/models/skills.dart';
import 'package:bureau_base/models/user.dart';
import 'package:flutter/services.dart';

class Employee {
  final User user;
  final String gender;
  final DateTime dob;
  final String qualification;
  final int workExperience;
  final List<Industry> industries;
  Employee({
    required this.user,
    required this.gender,
    required this.dob,
    required this.qualification,
    required this.workExperience,
    required this.industries,
  });

  Employee copyWith({
    User? user,
    String? gender,
    DateTime? dob,
    String? qualification,
    int? workExperience,
    List<Industry>? industries,
    List<Skills>? skills,
  }) {
    return Employee(
      user: user ?? this.user,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      qualification: qualification ?? this.qualification,
      workExperience: workExperience ?? this.workExperience,
      industries: industries ?? this.industries,
    );
  }

  Map<String, dynamic> toMap() {
    String updatedGender;

    if (gender == "Male") {
      updatedGender = "M";
    } else if (gender == "Female") {
      updatedGender = "F";
    } else {
      updatedGender = "O";
    }
    return {
      'user': user.toMap(),
      'gender': updatedGender,
      'dob': dob.millisecondsSinceEpoch,
      'qualification': qualification,
      'workExperience': workExperience,
      'industries': industries.map((x) => x.toMap()).toList(),
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      user: User.fromMap(map['user']),
      gender: map['gender'] ?? '',
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob']),
      qualification: map['qualification'] ?? '',
      workExperience: map['workExperience']?.toInt() ?? 0,
      industries: List<Industry>.from(
          map['industries']?.map((x) => Industry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee(user: $user, gender: $gender, dob: $dob, qualification: $qualification, workExperience: $workExperience, industries: $industries)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Employee &&
        other.user == user &&
        other.gender == gender &&
        other.dob == dob &&
        other.qualification == qualification &&
        other.workExperience == workExperience &&
        listEquals(other.industries, industries);
  }

  @override
  int get hashCode {
    return user.hashCode ^
        gender.hashCode ^
        dob.hashCode ^
        qualification.hashCode ^
        workExperience.hashCode ^
        industries.hashCode;
  }
}
