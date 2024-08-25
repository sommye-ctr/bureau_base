import 'dart:convert';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String profilePhoto;
  final String bio;
  final String city;
  final String state;
  final String pincode;
  final bool isEmployee;
  final bool isEmployer;
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.bio,
    required this.city,
    required this.state,
    required this.pincode,
    required this.isEmployee,
    required this.isEmployer,
  });

  User copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? profilePhoto,
    String? bio,
    String? city,
    String? state,
    String? pincode,
    bool? isEmployee,
    bool? isEmployer,
  }) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      bio: bio ?? this.bio,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      isEmployee: isEmployee ?? this.isEmployee,
      isEmployer: isEmployer ?? this.isEmployer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'profilePhoto': profilePhoto,
      'bio': bio,
      'city': city,
      'state': state,
      'pincode': pincode,
      'isEmployee': isEmployee,
      'isEmployer': isEmployer,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      profilePhoto: map['profile_photo'] ?? '',
      bio: map['bio'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      pincode: map['pincode'] ?? '',
      isEmployee: map['is_employee'] ?? false,
      isEmployer: map['is_employer'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, firstName: $firstName, lastName: $lastName, profilePhoto: $profilePhoto, bio: $bio, city: $city, state: $state, pincode: $pincode, isEmployee: $isEmployee, isEmployer: $isEmployer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.profilePhoto == profilePhoto &&
        other.bio == bio &&
        other.city == city &&
        other.state == state &&
        other.pincode == pincode &&
        other.isEmployee == isEmployee &&
        other.isEmployer == isEmployer;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        profilePhoto.hashCode ^
        bio.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        isEmployee.hashCode ^
        isEmployer.hashCode;
  }
}
