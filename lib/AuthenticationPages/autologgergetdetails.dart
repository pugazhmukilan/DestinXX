import 'package:destin/Constants/firebasefunctions.dart';
import "package:destin/Home.dart";
import 'package:destin/constants.dart';
import 'package:destin/main.dart';
import 'package:flutter/material.dart';


class GetdetailsLoader extends StatefulWidget {
  const GetdetailsLoader({super.key});

  @override
  State<GetdetailsLoader> createState() => _GetdetailsLoaderState();
}

class _GetdetailsLoaderState extends State<GetdetailsLoader> {
  @override
  void initState() {
    super.initState();
    // Call your function to set details
    setDetails();
  }

  Future<void> setDetails() async {
    // Replace with your logic to get email from SharedPreferences
    UserID = prefs!.getString("email").toString();
    //getthe username
    UserName = await getUserName(UserID);
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/logos/Mobile_firstPageLogo.png"),
      ),
    );
  }
}
