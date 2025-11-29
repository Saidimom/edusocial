import 'package:edu_social/features/shared/domain/entities/user.dart';

class UserModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String? maidenName;
  final int? age;
  final String gender;
  final String email;
  final String image;

  const UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      image: json['image'],
    );
  }

  factory UserModel.fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      maidenName: entity.maidenName,
      age: entity.age,
      gender: entity.gender,
      email: entity.email,
      image: entity.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'image': image,
    };
  }

  User toEntity() {
    return User(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      maidenName: maidenName,
      age: age,
      email: email,
      gender: gender,
      image: image,
    );
  }
}
