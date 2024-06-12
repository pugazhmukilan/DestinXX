
//import material package in flutter
import 'dart:ui';

import 'package:destin/Constants/firebasefunctions.dart';
import 'package:destin/constants.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  // @override
  // void initState(){
  //   super.initState();
  //   getResumeDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Kdestinxblack,
       /* image: DecorationImage(
          image: AssetImage('assets/Page_assets/slider_drawer_bg.png'),
        ),*/
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 5, left: 5),
                    child: Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {});
                        //   },
                        //   child: FutureBuilder<String>(
                        //     future:
                        //         loadImage(), // Replace 'loadImage()' with your function that fetches the image URL
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const CircularProgressIndicator(); // Display a loading indicator while fetching the image
                        //       } else if (snapshot.hasError) {
                        //         return Text('Error: ${snapshot.error}');
                        //       } else {
                        //         return CircleAvatar(
                        //           radius: 60,
                        //           foregroundImage: NetworkImage(pic),
                        //           // backgroundImage: NetworkImage(snapshot
                        //           //     .data!), // Display the image using NetworkImage
                        //         );
                        //       }
                        //     },
                        //   ),
                        // ),

                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(pic),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            UserName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              color:Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          UserID,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "JetBrainsMono",
                            color: Colors.white,
                          ),
                        ),
                        const Divider(),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              height: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            signOut(context);
                          },
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color:Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout_outlined,
                          color:Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    color:Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showConfirmationDialog(context);
                          },
                          child: const Text(
                            'Delete Account',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color:Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete_forever_outlined,
                          color:Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
