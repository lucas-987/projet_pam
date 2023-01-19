
import 'package:flutter/material.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';


class Register extends StatefulWidget {
  Register({super.key});




  @override
  _RegisterState createState()=> _RegisterState();

}//key for form

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  // text editing controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  // sign user in method

  String? checkFieldEmpty(String? fieldContent) { //<-- add String? as a return type
    if(fieldContent==null)return'Entrer au moin 4 caractères';
    if(fieldContent.length <4){
      return'Entrer au moin 4 caractères';
    }else return null;
  }
  @override
  Widget build(BuildContext context) {
    void signUserIn() {
      if(this.formKey.currentState!.validate()){
        Navigator.pushNamed(context, '/showEvents');
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
                  buildTextForm("adresse mail"),
                  buildTextForm("Enter Password first time "),
                  buildTextForm("Enter Password second time "),

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
  Widget buildTextForm(String message)=>Padding(
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
        validator: checkFieldEmpty
    ),

  );
}