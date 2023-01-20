
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:share_wood_front/Model/Actual.dart';
import 'package:share_wood_front/Model/user.dart';
import 'package:share_wood_front/front_pages/event_page.dart';
import '../Model/categorie.dart';
import '../Model/event.dart';
import '../Model/role.dart';
import '../Model/token.dart';
import '../component/app_color.dart';

import 'package:http/http.dart' as http;
class ListEvent extends StatefulWidget{
   int version=0;

   ListEvent({super.key, required this.version});


  @override
  _ListEventState createState()=> _ListEventState();


}

class _ListEventState extends State<ListEvent>{

  late List<Evenement> events=[];
  bool isLoading=false;


  @override
  Widget build(BuildContext context) =>Scaffold(


    body: Center(child:
          buildEvents()
      ,),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: (){Navigator.pushNamed(context, '/addEvent');}

    ),
  );

  @override
  void initState(){

    setState(() {
      super.initState();
      refreshEvents();
    });
  }

  @override
  Future refreshEvents() async{
    Token.loadToken();
    String token = Token.auth;
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse('http://localhost:8080/api/event'), headers: headers);

    this.events.clear();
    List<dynamic> jsonMap = json.decode(response.body);

    setState(() {
      jsonMap.forEach((element) {
        Map<String,dynamic> map = Map.from(element);
        Evenement e1 = Evenement.fromJson(map);
        List<dynamic> participant = map["participants"];
        participant.forEach((participant) {
          Map<String,dynamic> map2 = Map.from(participant);
          e1.participants.add(User.fromJson(map2));
        });
        events.add(e1);
      });
      if(this.widget.version==0){
        events.sort((a, b) => a.start_date.compareTo(b.start_date));
      }else if(this.widget.version==1){
        events.sort((a, b) => a.score.compareTo(b.score));
      }else if(this.widget.version==2){
        events.removeWhere((event) => event.creator.username != Actual.name);
      }else if(this.widget.version==3){
        events.removeWhere((event) => event.location != Actual.location);
      }
    });


  }


  @override
  void dispose(){
    super.dispose();
  }

  Future<void> upEvent(int idEvent) async {
    Token.loadToken();
    String token = Token.auth;
    setState(() {
      events.firstWhere((element) => element.id==idEvent).score++;
    });
    final response = await http.put(
      Uri.parse('http://localhost:8080/api/event/$idEvent/like'),headers: {'Authorization': 'Bearer $token','Content-Type': 'application/json'}
    );
    response;
  }

  Future<void> downEvent(int idEvent) async {
    Token.loadToken();
    String token = Token.auth;
    setState(() {
      events.firstWhere((element) => element.id==idEvent).score--;
    });
    final response = await http.put(
      Uri.parse('http://localhost:8080/api/event/$idEvent/unlike'),headers: {'Authorization': 'Bearer $token','Content-Type': 'application/json'}
    );
    response;
  }


  Widget buildEvents() =>StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      itemCount: events.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(20),
      crossAxisCount: 4,

      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context,index){
        Evenement event = events[index];
        return GestureDetector(

          child: eventCard(event)
        );
      }
  );


  Widget eventCard(Evenement evenement)=>

      GestureDetector(
        onTap: () {Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> EventPage(event: evenement,),
        ));},
        child:  Card(
            shadowColor: AppColors.primaryColor,
            elevation: 8,
            clipBehavior: Clip.antiAlias,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),

            child: Container(

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor,AppColors.secondaryColor],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                ),


                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          evenement.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                          ),
                        )

                      ],
                    ),
                    Column(

                      children: [
                        IconButton(onPressed: (){
                          upEvent(evenement.id);
                        }, icon: Icon(Icons.keyboard_arrow_up,color: Colors.white,)),
                        Text(
                          evenement.score.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        IconButton(onPressed: (){downEvent(evenement.id);}, icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,)),
                      ],
                    )
                  ],
                )



            )
        )
      );


}


