import 'dart:convert';

import 'package:bureau_base/models/employer.dart';
import 'package:bureau_base/models/industry.dart';

class JobPost {
  final String description;
  final DateTime datePosted;
  final String image;
  final String quotation;
  final Employer employer;
  final String qualification;
  final Industry industry;
  final String city;
  final String state;
  final String pincode;
  final bool isContactHidden;
  JobPost({
    required this.description,
    required this.datePosted,
    required this.image,
    required this.quotation,
    required this.employer,
    required this.qualification,
    required this.industry,
    required this.city,
    required this.state,
    required this.pincode,
    required this.isContactHidden,
  });

  JobPost copyWith({
    String? description,
    DateTime? datePosted,
    String? image,
    String? quotation,
    Employer? employer,
    String? qualification,
    Industry? industry,
    String? city,
    String? state,
    String? pincode,
    bool? isContactHidden,
  }) {
    return JobPost(
      description: description ?? this.description,
      datePosted: datePosted ?? this.datePosted,
      image: image ?? this.image,
      quotation: quotation ?? this.quotation,
      employer: employer ?? this.employer,
      qualification: qualification ?? this.qualification,
      industry: industry ?? this.industry,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      isContactHidden: isContactHidden ?? this.isContactHidden,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'datePosted': datePosted.millisecondsSinceEpoch,
      'image': image,
      'quotation': quotation,
      'employer': employer.toMap(),
      'qualification': qualification,
      'industry': industry.toMap(),
      'city': city,
      'state': state,
      'pincode': pincode,
      'isContactHidden': isContactHidden,
    };
  }

  factory JobPost.fromMap(Map<String, dynamic> map) {
    return JobPost(
      description: map['description'] ?? '',
      datePosted: DateTime.fromMillisecondsSinceEpoch(map['date_posted']),
      image: map['image'] ?? '',
      quotation: map['quotation'] ?? '',
      employer: Employer.fromMap(map['employer']),
      qualification: map['qualification'] ?? '',
      industry: Industry.fromMap(map['industry']),
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      pincode: map['pincode'] ?? '',
      isContactHidden: map['is_contact_hidden'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobPost.fromJson(String source) =>
      JobPost.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobPost(description: $description, datePosted: $datePosted, image: $image, quotation: $quotation, employer: $employer, qualification: $qualification, industry: $industry, city: $city, state: $state, pincode: $pincode, isContactHidden: $isContactHidden)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JobPost &&
        other.description == description &&
        other.datePosted == datePosted &&
        other.image == image &&
        other.quotation == quotation &&
        other.employer == employer &&
        other.qualification == qualification &&
        other.industry == industry &&
        other.city == city &&
        other.state == state &&
        other.pincode == pincode &&
        other.isContactHidden == isContactHidden;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        datePosted.hashCode ^
        image.hashCode ^
        quotation.hashCode ^
        employer.hashCode ^
        qualification.hashCode ^
        industry.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        isContactHidden.hashCode;
  }
}
