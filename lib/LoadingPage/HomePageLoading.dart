//import materials package from flutter
import 'package:destin/Constants/firebasefunctions.dart';
import 'package:destin/Home.dart';
import 'package:flutter/material.dart';


class Homepageloading extends StatefulWidget {
  const Homepageloading({super.key});

  @override
  State<Homepageloading> createState() => _HomepageloadingState();
}

class _HomepageloadingState extends State<Homepageloading> {
  bool _isNavigated = false;
  @override
 
     // Simulate a future function that fetches data
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage Loading'),
      ),
      body: FutureBuilder<String>(
        future: getResumeDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the future to complete, show a loading spinner
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If there was an error fetching data, show an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // Once the future completes, show the data
            return Home();
          } else {
            // Fallback for any other state
            return Center(
              child: Text('Unexpected state'),
            );
          }
        },
      ),
    );
  }
  }
