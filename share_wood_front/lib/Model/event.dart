




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
  User user;

  Evenement({
    required this.id,
    required this.name,
    required this.description,
    required this.score,
    required this.catego,
    required this.start_date,
    required this.end_date,
    required this.location,
    required this.user
  });




}

