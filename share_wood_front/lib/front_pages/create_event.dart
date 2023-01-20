
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_wood_front/component/app_color.dart';
import 'package:share_wood_front/component/my_button.dart';

import 'package:http/http.dart' as http;

import '../Model/token.dart';
class CreateEvent extends StatefulWidget{
  @override
  _CreateEventState createState()=> _CreateEventState();
  
}

class _CreateEventState extends State<CreateEvent> {
  final formKey = GlobalKey<FormState>(); //key for form
  DateTime dateTime = DateTime(2023,01,01,5,30);
  DateTime dateTimeEnd = DateTime(2023,01,01,5,30);
  final nameController = TextEditingController();
  final lieuController = TextEditingController();
  final descriptionController = TextEditingController();



  Future<http.Response> addEvent() async {
    Token.loadToken();
    String token = Token.auth;

    var formattedDate = dateTime.toUtc().toIso8601String();
    var formattedDate2 = dateTimeEnd.toUtc().toIso8601String();


    final headers = {'Authorization': 'Bearer $token','Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/event'),



    headers: headers,
    body: jsonEncode({
      "start_date":formattedDate,
      "end_date": formattedDate2,
      "name": nameController.text,
      "location": lieuController.text,
      "description": descriptionController.text,
    })

    );
    return response;
  }


  void signUserIn() async{
    if(this.formKey.currentState!.validate()){
      http.Response response = await addEvent();
      if(response.statusCode==200){
        Navigator.pushNamed(context, '/showEvents');
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    final hours = dateTime.hour.toString().padLeft(2,'0');
    final minutes = dateTime.minute.toString().padLeft(2,'0');
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



    return  Scaffold(
      key:  _scaffoldKey,
        appBar: AppBar(
          title: Text("Create Event"),
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
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child:ListView(
              padding: EdgeInsets.all(16),
              
              children: [
                SizedBox(height:16),
                buildTextForm(nameController,"EventName",checkFieldEmpty),
                SizedBox(height:16),
                buildTextForm(descriptionController,"Description",checkFieldEmpty),
                SizedBox(height:16),
                buildTextForm(lieuController,"Lieu",checkFieldEmpty),
                SizedBox(height:32),

                buildEventDate(dateTime),

                buildEventDate(dateTimeEnd),
                SizedBox(height:32),
                buildSubmit()
              ],
            ),
          ),
        )
    );

  }

  String? checkFieldEmpty(String? fieldContent) { //<-- add String? as a return type
    if(fieldContent==null)return'Entrer au moin 4 caractères';
    if(fieldContent.length <4){
      return'Entrer au moin 4 caractères';
    }else return null;
  }

  Widget buildTextForm(TextEditingController message,String hint,String? Function(String?) myfunction)=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: TextFormField(
        controller: message,
        obscureText: false,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText:  hint,
            hintStyle: TextStyle(color: Colors.grey[500])

        ),
        validator: myfunction
    ),

  );

  Widget buildSubmit() => MyButton(
      text: "Submit", onTap: signUserIn

  );

  Widget buildEventDate(DateTime dateTimeSt)=>Row(
    children: [
      MyButton(

          onTap: () async{
        final date =  await pickDate(dateTimeSt);
        if (date==null)return;
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          dateTimeSt.hour,
          dateTimeSt.minute,
        );
        setState(() {
          dateTimeSt = newDateTime;
        });
      },
        text: '${dateTimeSt.year}/${dateTimeSt.month}/${dateTimeSt.day}',
      ),
      MyButton(
          onTap: () async{
       final time = await  pickTime(dateTimeSt);

       if(time==null)return;
       final newDateTime = DateTime(
         dateTimeSt.year,
         dateTimeSt.month,
         dateTimeSt.day,
         time.hour,
         time.minute,
       );
       setState(() {
         dateTimeSt = newDateTime;
       });

      },
          text:'${dateTimeSt.hour.toString().padLeft(2,'0')}:${dateTimeSt.minute.toString().padLeft(2,'0')}'
      ),

    ],
  );

 Future<DateTime?> pickDate(DateTime dateTimeSt) => showDatePicker(
   context: context,
   initialDate: dateTimeSt,
   firstDate: DateTime(1900),
   lastDate: DateTime(2100),
 );

  Future<TimeOfDay?> pickTime(DateTime dateTimeSt)=>showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTimeSt.hour, minute: dateTimeSt.minute)
  );




}