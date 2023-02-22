import 'package:flutter/material.dart';
import 'package:flutter_flash_app/screens/chat_screen.dart';
import 'package:flutter_flash_app/screens/login_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';



void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
 
// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54)
        )
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(), 
        RegistrationScreenState.id:(context) => RegistrationScreenState(),
        Login.id:(context) => Login(),
        ChatScreen.id: (context) => ChatScreen()
      }
        
      );
    
  }
}
