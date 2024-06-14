import 'package:camera/camera.dart';
import 'package:destin/bloc/api_bloc/api_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AuthenticationPages/Loginpage.dart';
import 'AuthenticationPages/autologgergetdetails.dart';
import 'Constants/firebase_options.dart';
import 'constants.dart';

SharedPreferences? prefs;

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPreferences.getInstance();
  bool isloggedin = await checkLoginStatus();

  prefs = await SharedPreferences.getInstance();
  // prefs!.remove('email');
  //   prefs!.remove('password');
  // try {
    cameras = await availableCameras();
    _checkPermission();

    
  // } on Exception catch (_, e) {
  //   print("error in getting cameras");
  //   print(e.toString());
  //   return;
  // }

  runApp(MainApp(isloggedin));
  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  //const MainApp({super.key});
  final bool isloggedin;
  MainApp(this.isloggedin, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Kbackgroundcolor,
        home: Scaffold(
          body: isloggedin ? const GetdetailsLoader() : const Loginpage(),
          //body: Loginpage(),
        ),
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



void _checkPermission() async {
  if (await Permission.camera.request().isGranted) {
    // Permission is granted
    // Initialize camera here
    try {
      List<CameraDescription> cameras = await availableCameras();
      CameraController cameraController =
          CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await cameraController.initialize();
      // Add your camera handling logic here
      print('Camera permission is granted');
    } on CameraException catch (e) {
      if (e.code == "CameraAccessDenied") {
        print("User denied camera access.");
        // showErrorDialog(context, "User denied camera access.");
      } else {
        print("Handle other camera errors: ${e.code}");
        // showErrorDialog(context,
        //     "An error occurred: ${e.code}\nTry restarting the app");
      }
    } catch (e) {
      print("No camera found on the device: $e");
    }
  } else {
    // Permission denied
    // Handle the denial here, show a message to the user, or request again
    print('Camera permission is denied');
    // showErrorDialog(context, "error occured in the camera fetching.");
    
}}