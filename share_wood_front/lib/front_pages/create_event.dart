
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_wood_front/component/app_color.dart';
import 'package:share_wood_front/component/my_button.dart';

class CreateEvent extends StatefulWidget{
  @override
  _CreateEventState createState()=> _CreateEventState();
  
}

class _CreateEventState extends State<CreateEvent> {
  final formKey = GlobalKey<FormState>(); //key for form
  DateTime dateTime = DateTime(2023,01,01,5,30);


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
                buildTextForm("EventName",checkFieldEmpty),
                SizedBox(height:16),
                buildTextForm("Description",checkFieldEmpty),
                SizedBox(height:16),
                buildTextForm("Lieu",checkFieldEmpty),
                SizedBox(height:32),
                buildEventDate(),
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


  Widget buildTextForm(String message,String? Function(String?) myfunction)=>Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText:  message,
              hintStyle: TextStyle(color: Colors.grey[500])

          ),
          validator: myfunction
      ),
  );

  Widget buildSubmit() => MyButton(

      text: "Submit", onTap: () { final isValid = formKey.currentState!.validate();},


  );

  Widget buildEventDate()=>Row(
    children: [
      MyButton(

          onTap: () async{
        final date =  await pickDate();
        if (date==null)return;
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          dateTime.hour,
          dateTime.minute,
        );
        setState(() {
          dateTime = newDateTime;
        });
      },
        text: '${dateTime.year}/${dateTime.month}/${dateTime.day}',
      ),
      MyButton(
          onTap: () async{
       final time = await  pickTime();

       if(time==null)return;
       final newDateTime = DateTime(
         dateTime.year,
         dateTime.month,
         dateTime.day,
         time.hour,
         time.minute,
       );
       setState(() {
         dateTime = newDateTime;
       });

      },
          text:'${dateTime.hour.toString().padLeft(2,'0')}:${dateTime.minute.toString().padLeft(2,'0')}'
      ),

    ],
  );

 Future<DateTime?> pickDate() => showDatePicker(
   context: context,
   initialDate: dateTime,
   firstDate: DateTime(1900),
   lastDate: DateTime(2100),
 );

  Future<TimeOfDay?> pickTime()=>showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );

}