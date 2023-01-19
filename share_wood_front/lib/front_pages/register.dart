
import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/role.dart';
import '../Model/user.dart';
import '../component/my_button.dart';
import '../component/my_textfield.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({super.key});




  @override
  _RegisterState createState()=> _RegisterState();

}//key for form

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  // text editing controllers

  final usernameController = TextEditingController();

  final mailController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();


  // sign user in method

  String? checkFieldEmpty(String? fieldContent) { //<-- add String? as a return type
    if(fieldContent==null)return'Entrer au moin 4 caractères';
    if(fieldContent.length <4){
      return'Entrer au moin 4 caractères';
    }else return null;
  }



  Future<http.Response> signIn(User user) async {
    final http.Response response = await http.post(
      Uri.parse('https://localhost:8080/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    final token = response.headers.values.elementAt(1);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    void signUserIn() async {
      if(this.formKey.currentState!.validate()){
        http.Response response = await signIn(new User(username: usernameController.text,
            email: mailController.text, location: locationController.text, password: passwordController.text, role: Role.USER));
        if(response.statusCode==200){
          Navigator.pushNamed(context, '/');
        }
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:
        Center(

            child: Form(
              key: formKey, //
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  buildTextForm(usernameController,"UserName",checkFieldEmpty),
                  buildTextForm(mailController,"adresse mail",checkFieldEmpty),
                  buildTextForm(locationController, "Location",checkFieldEmpty),
                  buildTextForm(passwordController,"Enter Password first time ",checkFieldEmpty),

                  const SizedBox(height: 10),
                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: signUserIn,
                    text: "Finaliser",
                  ),

                  const SizedBox(height: 50),

                  // or continue with


                  const SizedBox(height: 50),

                  // google + apple sign in buttons

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
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
}