
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:share_wood_front/Model/token.dart';
import 'package:share_wood_front/front_pages/register.dart';

import '../Model/Actual.dart';
import '../component/my_button.dart';
import '../component/my_textfield.dart';

import 'package:http/http.dart' as http;
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

  Future<http.Response> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/login?username=$username&password=$password'),
    );
    final token = response.headers.values.elementAt(1);
    final jsonMap = response.body;
    Token.auth=token;
    Token.saveToken();
    final headers = {'Authorization': 'Bearer $token'};
    final response2 = await http.get(Uri.parse('http://localhost:8080/api/user?name=$username'), headers: headers);


    List<dynamic> jsonMap2 = json.decode(response2.body);
    jsonMap2.forEach((element) {
      Map<String,dynamic> map = Map.from(element);
      Actual.id = map["id"];
      Actual.name = map["username"];
      Actual.mail = map["email"];
      Actual.location = map["location"];
    });
    return response;
  }
  @override
  Widget build(BuildContext context) {


    void signUserIn() async{
      if(this.formKey.currentState!.validate()){
        http.Response response = await login(usernameController.text,passwordController.text);
        if(response.statusCode==200){
          Navigator.pushNamed(context, '/showEvents');
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
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              buildTextForm(usernameController,'UserName',checkFieldEmpty),
              buildTextForm(passwordController,"Password",checkFieldEmpty),


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


  Widget buildTextForm(TextEditingController message,String hint,String? Function(String?) myfunction)=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: TextFormField(
      controller: message,
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
          hintText:  hint,
          hintStyle: TextStyle(color: Colors.grey[500])

      ),
      validator: myfunction
    ),

  );
}