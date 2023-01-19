




import 'package:share_wood_front/Model/role.dart';

final String tableevent = "event";

class User {

  String username;
  String password;
  String email;
  String location;
  int role;
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





}

