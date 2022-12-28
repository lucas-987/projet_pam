

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:share_wood_front/front_pages/app_bar.dart';

import '../Model/event.dart';

class ListEvent extends StatefulWidget{
  @override
  _ListEventState createState()=> _ListEventState();

  Evenement event1 = new Evenement(
      name: 'Event1', categorie: '', description: '', score: 0
      );

  Evenement event2 = new Evenement(
      name: 'Event1', categorie: '', description: '', score: 0
  );

  Evenement event3 = new Evenement(
      name: 'Event1', categorie: '', description: '', score: 0
  );

  Evenement event4 = new Evenement(
      name: 'Event1', categorie: '', description: '', score: 0
  );




}

class _ListEventState extends State<ListEvent>{

  late List<Evenement> events=[this.widget.event1,this.widget.event2,this.widget.event3,this.widget.event4];
  bool isLoading=false;


  @override
  Widget build(BuildContext context) =>Scaffold(


    body: Center(child:
          buildEvents()
      ,),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: (){}

    ),
  );

  @override
  void initState(){
    super.initState();
    refreshEvents();
  }

  @override
  Future refreshEvents() async{

  }



  @override
  void dispose(){

    super.dispose();
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

          child: eventCard(event.name)
        );
      }
  );

}



Widget eventCard(String title)=>Card(
    shadowColor: Colors.red,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red,Colors.black],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )
      ),

      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          )
        ],
      ),
    )
);