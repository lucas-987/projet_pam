




import 'package:share_wood_front/Model/role.dart';

final String tableevent = "event";

class User {

  String username;
  String password;
  String email;
  String location;
  String role;
  User({
    required this.username,
    required this.email,
    required this.location,
    required this.password,
    required this.role

  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
    'location': location,
    'role': role,
  };


  factory User.fromJson(Map<String, dynamic> json) {
    return User(

        username: json['username'],
        email: json['email'],
        password: json['password'],
        location: json['location'],
        role: json['role']
    );
  }





}

