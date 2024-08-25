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
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.bio,
    required this.city,
    required this.state,
    required this.pincode,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, firstName: $firstName, lastName: $lastName, profilePhoto: $profilePhoto, bio: $bio, city: $city, state: $state, pincode: $pincode)';
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
        other.pincode == pincode;
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
        pincode.hashCode;
  }
}
