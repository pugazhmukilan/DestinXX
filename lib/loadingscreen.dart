import 'package:flutter/material.dart';

import "Resume.dart";
import 'firebasefunctions.dart';

class LoadingPage extends StatefulWidget {
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
              return CircularProgressIndicator();
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



Future<String> getResumeDetails()async{
  SavedName =  await getFieldFromUserDocument("UserName");
  Date =  await getFieldFromUserDocument("DBdate");
  Month =  await getFieldFromUserDocument("DBmonth");
  Year =  await getFieldFromUserDocument("DByear");
  Intro =  await getFieldFromUserDocument("DBintro");
  Skills =  await getFieldFromUserDocument("DBskills");
  Language =  await getFieldFromUserDocument("DBlanguage");
  Experience =  await getFieldFromUserDocument("DBexperience");
  Education =  await getFieldFromUserDocument("DBeducation");
  return Education;
}