import 'package:flutter/material.dart';
import 'package:destin/Constants/firebasefunctions.dart';

class testingpage extends StatefulWidget {
  const testingpage({super.key});

  @override
  State<testingpage> createState() => _testingpageState();
}

class _testingpageState extends State<testingpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      addfieldscompany(
                          'Companynames', 'something@gmail.com', 'Sankar');
                    },
                    child: const Text("Press")),
              ),
              ElevatedButton(
                  onPressed: () {
                    createhackathon('google@gmail.com', 'Developer');
                  },
                  child: const Text("Press")),
              ElevatedButton(
                  onPressed: () {
                    createjob('something@gmail.com', 'Designer');
                  },
                  child: const Text("Press")),
            ],
          ),
        ),
      ),
    );
  }
}
