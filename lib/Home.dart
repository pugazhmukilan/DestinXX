//import 'package:destin/Resume.dart';
import 'dart:typed_data';
import 'dart:ui';

import 'package:destin/FeaturesPage/Resume.dart';
import 'package:destin/Widgets/github_insta_creator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:image_picker/image_picker.dart';

import "Constants/firebasefunctions.dart";
import 'InterviewPages/Interview.dart';
import 'backdropbox.dart';
import 'constants.dart';
import "main.dart";

bool Resume_detail_collecting = false;
double screenWidth = 0;
int currentIndex = 0;
final GlobalKey<SliderDrawerState> _sliderDrawerkey =
    GlobalKey<SliderDrawerState>();
Future<void> setdetails() async {
  UserID = prefs!.getString("email").toString();
  //getthe username
  UserName = await getUserName(UserID);
  pic = await getUrlFromUserDocument("ProfilePic");
}

Future<String> loadImage() async {
  pic = await getUrlFromUserDocument("ProfilePic");
  return pic;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  /* static void signOut(BuildContext context) {

    try {
      signOut(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signinpage()));
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }*/
}

class _HomeState extends State<Home> {
  final GlobalKey<SliderDrawerState> _sliderDrawerkey =
      GlobalKey<SliderDrawerState>();
  /*Future<void> _signOut() async {
    try {
      signOut(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signinpage()));
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      key: _sliderDrawerkey,
      appBar: SliderAppBar(
        drawerIcon: null,
        //trailing: Image.asset('assets/Page_assets/appbar_main.png',height: 50,),
        appBarHeight: 100,
        appBarColor: Colors.white,
        /* flexibleSpace:
              Image.asset("assets/Page_assets/appbar_main.png", height: 300),*/

        //backgroundColor: Color.fromARGB(255, 255, 254, 254),
        title: Row(
          children: [
            Image.asset("assets/logos/Mobile_LoginPageLogo.png", height: 46),
            Image.asset("assets/logos/Mobile_firstPgeText.png", height: 20),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        trailing: null,
      ),
      slider: const MenuWidget(),
      child: const HomeMain(),
    ));
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: FutureBuilder<String>(
                            future:
                                loadImage(), // Replace 'loadImage()' with your function that fetches the image URL
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator(); // Display a loading indicator while fetching the image
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(snapshot
                                      .data!), // Display the image using NetworkImage
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            UserName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "JetBrainsMono",
                              color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.white,
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

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final ScrollController _scrollController = ScrollController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentIndex = 0;
  Future<String> getResumeDetails(BuildContext context) async {
    setState(() {
      Resume_detail_collecting = true;
    });

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
    pic = await getUrlFromUserDocument("ProfilePic");
    pic = pic;
    setState(() {
      Resume_detail_collecting = false;
    });
    return pic;
  }

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

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kdestinxwhite,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Kbackgroundcolor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(size: 22),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
            BottomNavigationBarItem(
                icon: Resume_detail_collecting
                    ? CircularProgressIndicator(color: Colors.grey)
                    : Icon(Icons.file_copy_outlined),
                label: "Resume"),
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
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoadingPage()));*/
                  getResumeDetails(context).then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Resume())));
                } else if (currentIndex == 3) {
                  //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                  setState(() {
                    currentIndex = newIndex;
                    if (currentIndex == 3) {
                      /*_sliderDrawerkey.currentState!
                          .openSlider(); */ // Open slider drawer when "Accounts" is pressed
                      _showBottomAlertDialog(context);
                    } else {
                      // Handle other taps
                    }
                  });
                }
              },
            );

            shape:
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            );
          },
        ),
        /* appBar: AppBar(
          
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
        ),*/
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
                          child: FutureBuilder<String>(
                            future:
                                loadImage(), // Replace 'loadImage()' with your function that fetches the image URL
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircleAvatar(
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Kdestinxorange,
                                  )),
                                ); // Display a loading indicator while fetching the image
                              } else if (snapshot.hasError) {
                                print(Text('Error: ${snapshot.error}'));
                                return Image(
                                    image: AssetImage(
                                        'assets/image_assets/user_background.png'));
                              } else {
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(snapshot
                                      .data!), // Display the image using NetworkImage
                                );
                              }
                            },
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
                          operation: () {
                            print("this is worlin");
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Git_insta_direct_box(
                                  github: 'https://github.com/pugazhmukilan',
                                  instagram:
                                      'https://www.instagram.com/mukil_arena/',
                                  linkedin:
                                      'https://www.linkedin.com/in/pugazh-mukilan-922206251/',
                                  name: 'Pugazh Mukilan',
                                );
                              },
                            );
                          }),
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Hemanthkumar.png",
                          operation: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Git_insta_direct_box(
                                  github: 'https://github.com/Hemanth-Kumar-04',
                                  instagram:
                                      'https://www.instagram.com/h_e_m_a_n_t_h04/',
                                  linkedin:
                                      'https://www.linkedin.com/in/hemanth-kumar-4b8471275/',
                                  name: 'Hemanth Kumar',
                                );
                              },
                            );
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Tarun.png",
                          operation: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Git_insta_direct_box(
                                  github: 'https://github.com/tarun-sakthivel',
                                  instagram: 'https://www.instagram.com/',
                                  linkedin:
                                      'https://www.linkedin.com/in/tarun-sakthivel-0b904a254/',
                                  name: 'Tarun',
                                );
                              },
                            );
                          }),
                      NameFeaturesButton(
                          imagepath: "assets/Page_assets/Karthik sagar.png",
                          operation: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Git_insta_direct_box(
                                  github: 'https://github.com/karthiksagarN',
                                  instagram:
                                      'https://www.instagram.com/karthik.sagarn/',
                                  linkedin:
                                      'https://www.linkedin.com/in/karthik-sagar-nallagula-3b1983285/',
                                  name: 'Karthik sagar',
                                );
                              },
                            );
                          }),
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
        onTap: operation,
        child: Image.asset(
          imagepath,
          fit: BoxFit.contain,
        ));
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

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Delete Account",
          style: TextStyle(color: Colors.red),
        ),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to Delete this Account?",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              deleteAccountAndSignOut(UserID, context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Text('Yes'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}
