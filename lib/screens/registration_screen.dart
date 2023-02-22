import 'package:flutter/material.dart';
import 'package:flutter_flash_app/components/buttons.dart';
import 'package:flutter_flash_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegistrationScreenState extends StatefulWidget {
  const RegistrationScreenState({super.key});

  static String id = 'registration_screen';

  @override
  State<RegistrationScreenState> createState() => RegistrationScreenStateState();
}

class RegistrationScreenStateState extends State<RegistrationScreenState> {
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
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
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
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                     borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                onChanged: ((value) {
                  email = value;
                }),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
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
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                     borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                onChanged: ((value) {
                  password = value;
                }),
              ),
              SizedBox(
                height: 20.0,
              ),
      
             Buttons(
              'Register',
               () async{
                setState(() {
                  showSpinner = true;
                });
                try{
                  print(email);
                  print(password);
      
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if (newUser != null){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return ChatScreen();
                    })));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }
                catch(e){
                  print(e);
                  setState(() {
                    showSpinner = false;
                  });
                }

                
               },
               Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}