import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_wood_front/component/app_color.dart';

import '../component/navigation_drawer.dart';
import 'list_event.dart';

class MyAppBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MyAppBarState();

}

class _MyAppBarState extends State<MyAppBar> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) =>DefaultTabController(
    length: 4,

    child: Scaffold(
    drawer: NavigationDrawer(),

    appBar: AppBar(


      title: Text("Filter"),
      centerTitle: true,

      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notification_add)),
      ],
      //backgroundColor: Colors.blueAccent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor,AppColors.secondaryColor],
                begin: Alignment.bottomRight,
              end: Alignment.topLeft
          )
        ),
      ),

      bottom: TabBar(
        tabs: [
          Tab(text: "Recent",),
          Tab(text:"Populaires"),
          Tab(text: "Privé",),
          Tab(text: "Proche",)
        ],
      ),
    ),

    body: TabBarView(
      children: [
        ListEvent(version: 0,),
        ListEvent(version: 1,),
        ListEvent(version: 2,),
        ListEvent(version: 3,),
      ],
    ),
  )
  );



}




