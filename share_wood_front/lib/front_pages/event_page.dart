import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_wood_front/Model/event.dart';

import '../Model/token.dart';

import 'package:http/http.dart' as http;
class EventPage extends StatefulWidget {
  Evenement event;

  EventPage({ required this.event });



  @override
  _EventPageState createState()=> _EventPageState();

}


class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 50),
              Center(
                  child: Text(widget.event.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold))),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  color: Colors.transparent,
                  child: Text(widget.event.description,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),

              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  color: Colors.transparent,
                  child: Text(widget.event.location,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),

              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  color: Colors.transparent,
                  child: Text("Participants : " +widget.event.participants.map((user) => user.username).join(', '),
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),

              ),
              Center(
                child: Container(
                  color: Colors.transparent,
                  child: Text(widget.event.start_date.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),

              ),
              Center(
                child: Container(

                  color: Colors.transparent,
                  child: Text(widget.event.end_date.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Center(
                child: Container(

                  color: Colors.transparent,
                  child: Text(widget.event.description,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              ElevatedButton(onPressed: () async {
                Token.loadToken();
              String token = Token.auth;
              int idEvent = this.widget.event.id;
              final response = await http.get(
                  Uri.parse('http://localhost:8080/api/event/$idEvent/joinevent'),headers: {'Authorization': 'Bearer $token','Content-Type': 'application/json'}
              );
              if(response.statusCode==200){
                Navigator.pushNamed(context, '/showEvents');
              }
              }, child: Text("Rejoindre"))
            ],
          ),
        ],
      ),



    );
  }
}
