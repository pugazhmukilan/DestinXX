import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destin/Home.dart';
import 'package:destin/Resume.dart';
import 'package:destin/constants.dart';
import 'package:flutter/material.dart';

//import "Resume.dart";
import 'firebasefunctions.dart';

class homepic_loader extends StatefulWidget {
  const homepic_loader({super.key});

  @override
  _homepic_loaderState createState() => _homepic_loaderState();
}

class _homepic_loaderState extends State<homepic_loader> {
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Users').doc().snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is loading
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there is an error
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is available
          var profilePicUrl = snapshot.data!.get('ProfilePic');

          return CircleAvatar(
            backgroundImage: profilePicUrl == null
                ? AssetImage("assets/image_assets/user_background.png")
                : NetworkImage(profilePicUrl) as ImageProvider,
            radius: 50,
            backgroundColor: Color.fromARGB(255, 234, 234, 234),
          );
        }
      },
    );
  }
}
