import 'dart:convert';
import 'dart:typed_data';

import 'package:destin/Loginpage.dart';
import 'package:destin/Resume.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'Interview.dart';
import "constants.dart";
import "firebasefunctions.dart";
import "main.dart";
import "package:image_picker/image_picker.dart";

String pic = '';
double screenWidth = 0;
int currentIndex = 0;
String userEmail = '';
Uint8List? _image1;

Reference? imageRef;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    getImageurl();
    setdetails();
    print("===============================$UserName");
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle the logout
  Future<void> _logout(BuildContext context) async {
    try {
      // Sign out the user from Firebase Authentication
      await _auth.signOut();

      // Clear any local data or preferences associated with the user session
      // Example: LocalStorage.clearUserData();

      // Navigate to the login screen (you may replace this with your login route)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Loginpage()));
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  Future<void> setdetails() async {
    UserID = prefs!.getString("email").toString();
    //To get the image from the firebase

    //getthe username
    UserName = await getUserName(UserID);
  }

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    List<Widget> body = const [
      Icon(Icons.home),
      Icon(Icons.menu),
      Icon(Icons.person),
    ];
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kmainboard,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Kbackgroundcolor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(size: 22),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined), label: "Resume"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Accounts"),
          ],
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(
              () {
                currentIndex = newIndex;
                print("index is equal to+++++++ $currentIndex");
                if (currentIndex == 0) {
                } else if (currentIndex == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Interview()));
                } else if (currentIndex == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Resume()));
                } else if (currentIndex == 3) {
                  //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                  _showBottomAlertDialog(context);
                }
              },
            );

            shape:
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            );
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset("assets/logos/Mobile_LoginPageLogo.png", height: 45),
              Image.asset("assets/logos/Mobile_firstPgeText.png", height: 15),
              const SizedBox(
                width: 100,
              ),
              IconButton(
                  onPressed: () {
                    _logout(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 20,
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                //HEADER HEADER HEADER
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello...\u{1F44B}",
                                  style: Kcommontextstyle),
                              Text(
                                UserName,
                                style: Ktitletextstyle,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CircleAvatar(
                            backgroundImage: _image1 == null
                                ? NetworkImage(pic)
                                : const Image(
                                    image: AssetImage(
                                        'assets/image_assets/user_background.png'),
                                  ) as ImageProvider,
                            radius: 50,
                          ),
                        )
                      ]),

                  const SizedBox(height: 30),
                  //FEATURES FEATURES FEATURES
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageFeaturesButton(
                            imagepath: "assets/Page_assets/Reports_Button.png",
                            operation: () {
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath: "assets/Page_assets/Jobs_Button.png",
                            operation: () {
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath: "assets/Page_assets/Job_News.png",
                            operation: () {
                              print("pressing the find your reports");
                            }),
                      ],
                    ),
                  ),

                  ImageFeaturesButton(
                      imagepath:
                          "assets/Page_assets/Start_Interview_Button.png",
                      operation: () {}),

                  //BOTTOM BOTTOM BOTTOM
                  const Text("Made with\nCare!",
                      style: TextStyle(
                          fontFamily: "inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 163, 74, 246))),
                  const SizedBox(height: 10),
                  const Text("Coded with love by\nus for you!",
                      style: TextStyle(
                          fontFamily: "jetBrainsMono",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 123, 123))),
                  Row(
                    children: [
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/pugazh.png",
                          operation: () {}),
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Hemanthkumar.png",
                          operation: () {}),
                    ],
                  ),
                  Row(
                    children: [
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Tarun.png",
                          operation: () {}),
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Karthik sagar.png",
                          operation: () {}),
                    ],
                  ),
                ]),
          ),
        ));
  }
}

class FeaturesButton extends StatelessWidget {
  late Color startcolor;
  late Color endcolor;
  late String subtext;
  late String maintext;
  late String imagepath;
  late Function() operation;
  FeaturesButton({
    super.key,
    required this.startcolor,
    required this.endcolor,
    required this.subtext,
    required this.maintext,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: operation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startcolor, endcolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: KMyborder,
          ),

          //content inside the container
          child: Padding(
            //giving padding to the whole row to maintain the text properly
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtext,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Text(maintext,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                //container image
                Image.asset(imagepath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'This page is under construction',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 205, 23)),
            ),
          ),
        ),
      );
    },
  );
}

class ImageFeaturesButton extends StatelessWidget {
  late String imagepath;
  late Function() operation;
  ImageFeaturesButton({
    super.key,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: operation, child: Image.asset(imagepath, height: 145));
  }
}

class NameFeaturesButton extends StatelessWidget {
  late String imagepath;
  late Function() operation;
  NameFeaturesButton({
    super.key,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
          onTap: operation, child: Image.asset(imagepath, height: 35)),
    );
  }
}

Uint8List stringToUint8List(String inputString) {
  // Convert the string to UTF-8 bytes
  List<int> utf8Bytes = utf8.encode(inputString);

  // Create a Uint8List from the UTF-8 bytes
  Uint8List uint8List = Uint8List.fromList(utf8Bytes);

  return uint8List;
}

Future<void> getImageurl() async {
  pic = await getFieldFromUserDocument('ProfilePic');
}
