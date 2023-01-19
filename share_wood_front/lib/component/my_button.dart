import 'package:flutter/material.dart';

import 'app_color.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap , required this.text});
  _MyButtonState createState()=> _MyButtonState();

}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primaryColor,AppColors.secondaryColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft
            ),
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Text(
            this.widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}