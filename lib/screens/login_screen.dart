import 'package:flutter/material.dart';
import 'package:flutter_flash_app/components/buttons.dart';
import 'package:flutter_flash_app/constants.dart';
import 'package:flutter_flash_app/screens/chat_screen.dart';
import 'package:flutter_flash_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Login extends StatefulWidget {

  
  const Login({super.key});
  static String id = 'login_screen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100.0,
                ),
              ),
        
              
              SizedBox(
                height: 30.0,
              ),
              TextField (
                onChanged: (value){
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding: 
                    EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                     borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value){
                  password = value;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding: 
                    EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                     borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                
              ),
              SizedBox(
                height: 30.0,
              ),
      
              Buttons('Login', ()async{
                setState(() {
                  showSpinner = true;
                });
                try{
                   final appUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (appUser != null){
                    print(email);
                    print(password);
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }catch(e){
                  print(e);
                  setState(() {
                    showSpinner = false;
                  });
                }
                 
              }, Colors.redAccent)
            ],
          ),
        ),
      ),
    );
  }
}