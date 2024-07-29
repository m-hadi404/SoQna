import 'package:equatable/equatable.dart';

class User extends Equatable {

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final int age;
  final String image;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      id,
      username,
      email,
      firstName,
      lastName,
      age,
      image,
    ];
  }

}
