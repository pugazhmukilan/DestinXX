import 'package:destin/Resume.dart';
import 'package:destin/constants.dart';
import 'package:flutter/material.dart';

//import "Resume.dart";
import 'firebasefunctions.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Future<String> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    fetchDataFuture = getResumeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: fetchDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator while waiting for the data
              //return CircularProgressIndicator();
              return Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 100, right: 100),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image_assets/loading_for_fetching.png",
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 10),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text(
                        "Fetching your Resume data!",
                        style: Kcommontextstyle,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              // Handle errors
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been successfully retrieved, navigate to another page
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resume(),
                  ),
                );
              });

              // Return an empty container while navigating to another page
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Future<String> getResumeDetails() async {
  SavedName = await getFieldFromUserDocument("UserName");
  print("new user name============================$SavedName");
  Dob = await getFieldFromUserDocument("DBdob");
  Phone = await getFieldFromUserDocument("DBphone");
  Email = await getFieldFromUserDocument("DBemail");

  Intro = await getFieldFromUserDocument("DBintro");
  Skills = await getFieldFromUserDocument("DBskills");
  Language = await getFieldFromUserDocument("DBlanguage");
  Experience = await getFieldFromUserDocument("DBexperience");
  Education = await getFieldFromUserDocument("DBeducation");
  pic = await getFieldFromUserDocument("ProfilePic");
  return Education;
}
