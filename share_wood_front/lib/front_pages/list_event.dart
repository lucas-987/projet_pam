
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:share_wood_front/Model/user.dart';
import 'package:share_wood_front/front_pages/event_page.dart';
import '../Model/categorie.dart';
import '../Model/event.dart';
import '../component/app_color.dart';

class ListEvent extends StatefulWidget{


  @override
  _ListEventState createState()=> _ListEventState();

  Evenement event1 = new Evenement(
      id: 0,
      name: "Event1",
      description: "la recherche des cité d'or",
      score: 0,
      catego: Categorie.SPORTIF,
      start_date: DateTime.now(),
      end_date: DateTime.now(),
      location: "Perou",
      user: new User(id: 0, username: "Esteban", email: "Esteban@gmail.com", location: "Cité d'or"));
  Evenement event2= new Evenement(
      id: 0,
      name: "Event2",
      description: "la recherche des cité d'or",
      score: 0,
      catego: Categorie.SPORTIF,
      start_date: DateTime.now(),
      end_date: DateTime.now(),
      location: "Perou",
      user: new User(id: 0, username: "Esteban", email: "Esteban@gmail.com", location: "Cité d'or"));

  Evenement event3 = new Evenement(
      id: 0,
      name: "Event3",
      description: "la recherche des cité d'or",
      score: 0,
      catego: Categorie.SPORTIF,
      start_date: DateTime.now(),
      end_date: DateTime.now(),
      location: "Perou",
      user: new User(id: 0, username: "Esteban", email: "Esteban@gmail.com", location: "Cité d'or"));

  Evenement event4 =new Evenement(
      id: 0,
      name: "Event4",
      description: "la recherche des cité d'or",
      score: 0,
      catego: Categorie.SPORTIF,
      start_date: DateTime.now(),
      end_date: DateTime.now(),
      location: "Perou",
      user: new User(id: 0, username: "Esteban", email: "Esteban@gmail.com", location: "Cité d'or"));


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

  }



  @override
  void dispose(){

    super.dispose();
  }

  void upEvent(int idEvent){

    setState(() {
      events.elementAt(idEvent).score++;
    });
  }

  void downEvent(int idEvent){

    setState(() {
      events.elementAt(idEvent).score--;
    });
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


