




import 'package:share_wood_front/Model/user.dart';

import 'categorie.dart';

final String tableevent = "event";

class Evenement {
  int id;
  String name;
  String description;
  late int score;
  Categorie catego;
  DateTime start_date;
  DateTime end_date;
  String location;
  User creator;
 late List<User> participants =[];

  Evenement({
    required this.id,
    required this.name,
    required this.description,
    required this.score,
    required this.catego,
    required this.start_date,
    required this.end_date,
    required this.location,
    required this.creator,
  });


  factory Evenement.fromJson(Map<String, dynamic> json) {
    return Evenement(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      score: json['score'],
      start_date: DateTime.parse(json['start_date']),
      end_date: DateTime.parse(json['end_date']),
      location: json['location'],
      catego: Categorie.SPORTIF,
      creator:User.fromJson(Map.from(json['creator']))

    );
  }
}
