import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_wood_front/main.dart';

import 'list_event.dart';

class MyAppBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_MyAppBarState();

}

class _MyAppBarState extends State<MyAppBar> {
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
            colors: [Colors.red,Colors.black],
                begin: Alignment.bottomRight,
              end: Alignment.topLeft
          )
        ),
      ),

      bottom: TabBar(
        tabs: [
          Tab(text: "Recent",),
          Tab(text: "Commenté",),
          Tab(text:"Populaires"),
          Tab(text: "Privé",)
        ],
      ),
    ),

    body: TabBarView(
      children: [
        ListEvent(),
        ListEvent(),
        ListEvent(),
        ListEvent(),


      ],
    ),
  )
  );



}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(

    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context)=>Material(

    color: Colors.red,

    child: InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 24
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
            ),
            SizedBox(
              height: 12,
            ),
            Text('Insert User_name'),
            Text('insert_mail@mail.com')
          ],
        ),
      ),

    ),

  );
  Widget buildMenuItems(BuildContext context)=>Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: Text("home"),
        onTap: (){},
      )
    ],
  );


}
