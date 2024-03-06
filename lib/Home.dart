//import 'package:destin/Resume.dart';
import 'dart:typed_data';

import 'package:destin/Signinpage.dart';
import 'package:destin/loadingscreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Interview.dart';
import "constants.dart";
import "firebasefunctions.dart";
import "main.dart";

double screenWidth = 0;
int currentIndex = 0;

Future<String> setdetails() async {
  UserID = prefs!.getString("email").toString();
  //getthe username
  UserName = await getUserName(UserID);
  pic = await getUrlFromUserDocument("ProfilePic");
  pic = pic.replaceAll('////', '//');
  return pic;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    setdetails();

    print("===============================$UserName");
  }

  Uint8List? _image1;

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  chooseImages(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      return await image.readAsBytes();
    } else {
      return _showBottomAlertDialog(context);
    }
  }

  void selectImage() async {
    //have to set the bug for this  if I select the chood=seImage and come out without choosing the image
    try {
      Uint8List img = await chooseImages(ImageSource.gallery);

      setState(() {
        _image1 =
            img; //this will make tghe fn not null and galary will be opened
      });
    } catch (err) {}
  }

  Future<void> _signOut() async {
    try {
      signOut(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signinpage()));
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

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
                  setState(() {});
                } else if (currentIndex == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Interview()));
                } else if (currentIndex == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoadingPage()));
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
          flexibleSpace:
              Image.asset("assets/Page_assets/appbar_main.png", height: 300),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 255, 254, 254),
          title: Row(
            children: [
              Image.asset("assets/logos/Mobile_LoginPageLogo.png", height: 45),
              Image.asset("assets/logos/Mobile_firstPgeText.png", height: 15),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  _signOut();
                },
                icon: Icon(Icons.logout),
              ),
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
                          flex: 2,
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
                                : const AssetImage(
                                        "assets/image_assets/user_background.png")
                                    as ImageProvider,
                            radius: 50,
                            backgroundColor: Color.fromARGB(255, 234, 234, 234),
                          ),
                        )
                      ]),

                  const SizedBox(height: 20),
                  Text(
                    "Features",
                    style: Kcommontextstyle,
                  ),
                  Divider(
                    color: Kgreycolor_light,
                  ),
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
                              _showBottomAlertDialog(context);
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath: "assets/Page_assets/Jobs_Button.png",
                            operation: () {
                              _showBottomAlertDialog(context);
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath:
                                "assets/Page_assets/Internship Button.png",
                            operation: () {
                              _showBottomAlertDialog(context);
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath:
                                "assets/Page_assets/Hackathons button.png",
                            operation: () {
                              _showBottomAlertDialog(context);
                              print("pressing the find your reports");
                            }),
                        ImageFeaturesButton(
                            imagepath: "assets/Page_assets/Job_News.png",
                            operation: () {
                              _showBottomAlertDialog(context);
                              print("pressing the find your reports");
                            }),
                      ],
                    ),
                  ),

                  ImageFeaturesButton(
                      imagepath:
                          "assets/Page_assets/Start_Interview_Button.png",
                      operation: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Interview())));
                      }),
                  Row(
                    children: [
                      Image.asset("assets/Page_assets/faangtextimage.png",
                          height: 18),
                      const SizedBox(width: 10),
                      Text(
                        "Interview",
                        style: Kcommontextstyle,
                      ),
                    ],
                  ),
                  Divider(
                    color: Kgreycolor_light,
                  ),

                  ImageFeaturesButton(
                      imagepath: "assets/Page_assets/FAANG Button.png",
                      operation: () {
                        _showBottomAlertDialog(context);
                      }),

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
            backgroundColor: Colors.black.withOpacity(0.6),
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
