
import 'package:flutter/material.dart';
import 'package:share_wood_front/Model/Actual.dart';

import 'app_color.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Drawer(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) =>
      Material(

        color: AppColors.primaryColor,

        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top,
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
                Text(Actual.name),
                Text(Actual.mail)
              ],
            ),
          ),

        ),

      );

  Widget buildMenuItems(BuildContext context) =>
      Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text("home"),
            onTap: () { Navigator.pushNamed(context, '/showEvents');},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text("Mes evennements"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text("Couleurs picker"),
            onTap: () {
              Navigator.pushNamed(context, '/color_picker');
            },
          )
        ],
      );
}