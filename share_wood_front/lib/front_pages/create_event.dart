
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    colors: [Colors.red,Colors.black],
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
                buildEventName(),
                SizedBox(height:16),
                buildEventDescription(),
                SizedBox(height:16),
                buildEventLieu(),
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
  Widget buildEventName()=>TextFormField(
    decoration: InputDecoration(
      labelText: 'Nom Evenement',
      border: OutlineInputBorder(),
    ),

    onChanged: (value)=> setState(() {

    }),
    validator: (value){
      if(value==null)return'Entrer au moin 4 caractères';
      if(value.length <4){
        return'Entrer au moin 4 caractères';
      }else return null;
    },


  );
  Widget buildEventDescription()=>TextFormField(
    decoration: InputDecoration(
      labelText: 'Description courte',
      border: OutlineInputBorder(),
    ),
    onChanged: (value)=> setState(() {

    }),
    validator: (value){
      if(value==null)return'Entrer au moin 4 caractères';
      if(value.length <4){
        return'Entrer au moin 4 caractères';
      }else return null;
    },
  );
  Widget buildEventLieu()=>TextFormField(
    decoration: InputDecoration(
      labelText: 'Lieu',
      border: OutlineInputBorder(),
    ),
    onChanged: (value)=> setState(() {

    }),
    validator: (value){
      if(value==null)return'Entrer au moin 4 caractères';
      if(value.length <4){
        return'Entrer au moin 4 caractères';
      }else return null;
    },
  );

  Widget buildSubmit() => ElevatedButton(
      onPressed: (){
      final isValid = formKey.currentState!.validate();
  },
      child: Text("Submit"));

  Widget buildEventDate()=>Row(
    children: [
      ElevatedButton(


          onPressed: () async{
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
          child:Text('${dateTime.year}/${dateTime.month}/${dateTime.day}')
      ),
      ElevatedButton(onPressed: () async{
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
          child:Text('${dateTime.hour.toString().padLeft(2,'0')}:${dateTime.minute.toString().padLeft(2,'0')}')
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