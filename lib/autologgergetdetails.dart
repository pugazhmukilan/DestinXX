import "package:destin/home.dart";
import 'package:flutter/material.dart';

import "constants.dart";
import "firebasefunctions.dart";
import "main.dart";
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
    
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