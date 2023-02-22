import 'package:flutter/material.dart';
import 'package:flutter_flash_app/screens/login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter_flash_app/components/buttons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    
  
    
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),);
    animation = ColorTween(begin: Colors.yellowAccent, end: Colors.green).animate(controller);
      controller.forward();   
      controller.addListener(() {
        setState(() {});
      }) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Hero(
                    tag: 'logo',
                    child: Image(image: AssetImage("assets/images/logo.png"), height: 100,))
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat...', textStyle: TextStyle(fontSize: 55, fontWeight: FontWeight.w500)),
                  ],
                //   'Flash Chat', 
                // style: TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Buttons('Register', 
            (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return RegistrationScreenState();
              })));
            }, 
            Colors.lightBlueAccent),
            SizedBox(
              height: 30.0,
            ),
            Buttons('Login', 
            (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return Login();
              })));
            }, 
            Colors.redAccent),
          ],
        ),
      ),
    );
  }
}

// class Button extends StatelessWidget {
//   const Button({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//          Navigator.pushNamed(context, Login.id);
//         },
//         child: Text('Login'),
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           backgroundColor: Colors.lightBlueAccent,
//             padding: EdgeInsets.symmetric(vertical: 20.0)));
//   }
// }

