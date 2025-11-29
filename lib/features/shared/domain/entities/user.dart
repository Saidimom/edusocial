class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String? maidenName;
  final int? age;
  final String gender;
  final String email;
  final String image;

  const User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.maidenName,
    this.age,
    required this.email,
    required this.gender,
    required this.image,
  });
}
