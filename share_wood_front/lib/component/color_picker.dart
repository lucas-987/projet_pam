import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_wood_front/component/my_button.dart';

import 'app_color.dart';
import 'navigation_drawer.dart';

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {


  void _showColorPicker(int selector) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sélectionnez une couleur'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selector==1?AppColors.primaryColor:AppColors.secondaryColor,
              onColorChanged: (Color color) {
                setState(() {
                  if(selector==1){
                    AppColors.primaryColor=color;
                  }else{
                    AppColors.secondaryColor = color;
                  }

                  AppColors.saveColors();
                });
              },
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              paletteType: PaletteType.hsv,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Sélectionner'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: NavigationDrawer(),
      appBar: AppBar(

        title: const Text('Choix de la palette de couleur'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primaryColor,AppColors.secondaryColor],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft
              )
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            MyButton(
              text: 'Choisir la couleur principale',
              onTap: (){
                setState(() {
                  _showColorPicker(1);
                });},
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 20),
            MyButton(
              text: 'Choisir la couleur secondaire',
              onTap: (){setState(() {
                _showColorPicker(2);

              });},
            ),
          ],
        ),
      ),
    );
  }
}
