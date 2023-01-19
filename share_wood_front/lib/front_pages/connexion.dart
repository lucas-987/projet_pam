
import 'package:flutter/material.dart';
import 'package:share_wood_front/front_pages/register.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';


class Connexion extends StatefulWidget {
  Connexion({super.key});

  @override
  _ConnexionState createState()=> _ConnexionState();

}//key for form

class _ConnexionState extends State<Connexion> {
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
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              buildTextForm("UserName",checkFieldEmpty),
              buildTextForm("Password",checkFieldEmpty),


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
                text: "Sign In",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
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
}