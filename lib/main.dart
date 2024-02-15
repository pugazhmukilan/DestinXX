import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loginpage.dart';
import "autologgergetdetails.dart";
import 'constants.dart';
import 'firebase_options.dart';





SharedPreferences? prefs;

late List<CameraDescription> cameras;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  
  await SharedPreferences.getInstance();
  bool isloggedin = await checkLoginStatus();

  prefs = await SharedPreferences.getInstance();
  try{
  cameras = await availableCameras();
  }
  on Exception catch (_, e){
    print("error in getting cameras");
    print(e.toString());
    return;
  }
 

  runApp( MainApp(isloggedin));
  //runApp( MainApp());
}

class MainApp extends StatelessWidget {
  final bool isloggedin;
  MainApp(this.isloggedin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Kbackgroundcolor,
      home: Scaffold(
        body:isloggedin? GetdetailsLoader():Loginpage(),
         //body:Loginpage(),
      ),
    );
  }
}


Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedEmail = prefs.getString('email');
  String? storedPassword = prefs.getString('password');

  if (storedEmail != null && storedPassword != null) {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: storedEmail,
        password: storedPassword,
      );
      return true; // User is already logged in
    } catch (e) {
      print("Auto login failed: $e");
      return false; // User is not logged in or auto login failed
    }
  } else {
    return false; // User is not logged in
  }
}
