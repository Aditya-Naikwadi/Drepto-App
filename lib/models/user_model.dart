import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String age;
  final String gender;
  final String role; // 'Patient', 'Doctor', or 'Nurse'
  final String password;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
    required this.role,
    required this.password,
  });

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'age': age,
      'gender': gender,
      'role': role,
      'password': password,
    };
  }

  // Create User from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      role: json['role'] as String,
      password: json['password'] as String,
    );
  }

  // Convert to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Create User from JSON string
  factory UserModel.fromJsonString(String jsonString) {
    return UserModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }

  // Create a copy with modified fields
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? age,
    String? gender,
    String? role,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      password: password ?? this.password,
    );
  }

  // Get full name
  String get fullName => '$firstName $lastName';

  @override
  String toString() {
    return 'UserModel(id: $id, name: $fullName, email: $email, role: $role)';
  }
}
