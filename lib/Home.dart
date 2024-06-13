//import 'package:destin/Resume.dart';
import 'package:destin/FeaturesPage/Resume.dart';
import 'package:destin/HomePage/widgetMenu.dart';
import 'package:destin/Widgets/CustomSnackBar.dart';
import 'package:destin/Widgets/Stack_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import "Constants/firebasefunctions.dart";
import 'InterviewPages/Interview.dart';
import 'constants.dart';
bool is_testing_mode = true;
final GlobalKey<SliderDrawerState> _sliderDrawerkey =
    GlobalKey<SliderDrawerState>();

// Future<String> loadImage() async {
//   pic = await getUrlFromUserDocument("ProfilePic");
//   return pic;
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  //   super.initState();
  //   getResumeDetails();
  // }
  final GlobalKey<SliderDrawerState> _sliderDrawerkey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: fetched_details
            ? homeContainer(context)
            : FutureBuilder<String>(
                future: GetAllDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the future to complete, show a loading spinner
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Kdestinxblack,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset("assets/logos/Mobile_LoginPageLogo.png",
                                height: 35),
                            Image.asset("assets/logos/DESTINX.png", height: 25),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
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
                              icon: Icon(
                                Icons.meeting_room_outlined,
                                color: Color.fromARGB(255, 42, 42, 42),
                              ),
                              label: "Interview"),
                          BottomNavigationBarItem(
                              //icon: Resume_detail_collecting? CircularProgressIndicator(color:Colors.grey):Icon(Icons.file_copy_outlined), label: "Resume"),
                              icon: Icon(
                                Icons.file_copy_outlined,
                                color: Color.fromARGB(255, 42, 42, 42),
                              ),
                              label: "Resume"),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Color.fromARGB(255, 42, 42, 42),
                              ),
                              label: "Accounts"),
                        ],
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Please wait patiently while we fetch your data..",
                                style: Kcommontextstyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CircularProgressIndicator(
                              color: Kdestinxorange,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // If there was an error fetching data, show an error message
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    // Once the future completes, show the data
                    fetched_details = true;
                    return homeContainer(context);
                  } else {
                    // Fallback for any other state
                    return Center(
                      child: Text('Unexpected state'),
                    );
                  }
                }));
  }

  SliderDrawer homeContainer(BuildContext context) {
    return SliderDrawer(
      key: _sliderDrawerkey,
      appBar: SliderAppBar(
        drawerIconColor: Kdestinxwhite,
        //trailing: Image.asset('assets/Page_assets/appbar_main.png',height: 50,),
        appBarHeight: 80,
        appBarColor: Kdestinxblack,
        /* flexibleSpace:
              Image.asset("assets/Page_assets/appbar_main.png", height: 300),*/

        //backgroundColor: Color.fromARGB(255, 255, 254, 254),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset("assets/logos/Mobile_LoginPageLogo.png", height: 35),
            Image.asset("assets/logos/DESTINX.png", height: 25),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            )),
      ),
      slider: const MenuWidget(),
      child: const HomeMain(),
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

  @override
  void initState() {
    super.initState();
    //getResumeDetails();

    // setdetails();
    // print("===============================$UserName");
  }

  // Uint8List? _image1;

  // final ImagePicker _picker = ImagePicker();
  // XFile? _image;
  // chooseImages(ImageSource source) async {
  //   final XFile? image = await _picker.pickImage(source: source);
  //   if (image != null) {
  //     return await image.readAsBytes();
  //   } else {
  //     return _showBottomAlertDialog(context);
  //   }
  // }

  // void selectImage() async {
  //   //have to set the bug for this  if I select the chood=seImage and come out without choosing the image
  //   try {
  //     Uint8List img = await chooseImages(ImageSource.gallery);

  //     setState(() {
  //       _image1 =
  //           img; //this will make tghe fn not null and galary will be opened
  //     });
  //   } catch (err) {}
  // }

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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
            BottomNavigationBarItem(
                //icon: Resume_detail_collecting? CircularProgressIndicator(color:Colors.grey):Icon(Icons.file_copy_outlined), label: "Resume"),
                icon: Icon(Icons.file_copy_outlined),
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
                  //getResumeDetails(context).then((value) =>Navigator.push(context, MaterialPageRoute(builder: (context)=> Resume())));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Resume()));
                } else if (currentIndex == 3) {
                  //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                  setState(() {
                    currentIndex = newIndex;
                    if (currentIndex == 3) {
                      /*_sliderDrawerkey.currentState!
                          .openSlider(); */ // Open slider drawer when "Accounts" is pressed
                      SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              
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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
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
                              const Text("Hello...\u{1F44B}",
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                UserName,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: CircleAvatar(
                          radius: 40,
                          foregroundImage: NetworkImage(pic),
                        ))
                      ]),

                  const SizedBox(height: 15),
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
                        StackWidgets(
                          containerHeight: 113,
                          containerWidth: 250,
                          text1Style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter"),
                          text2Style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          containerColor:
                              const Color.fromARGB(255, 255, 241, 202),
                          stackImage:
                              "assets/stack_image/interview_stack_image.png",
                          waterMarkImage:
                              "assets/stack_image/interview_watermark.png",
                          stackImageLeft: 65,
                          stackImageSize: 4,
                          stackImageTop: 0,
                          watermarkLeft: 0,
                          watermarkTop: 5,
                          text1: "Find your",
                          text2: "Interview",
                          borderRadius: 10,
                          text_left: 20,
                          ontapp: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Interview()));
                          },
                        ),
                        StackWidgets(
                                      containerHeight: 113,
                                      containerWidth: 250,
                                      text1Style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                                      text2Style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      containerColor: Color.fromARGB(255, 223, 247, 229),
                                      stackImage: "assets/stack_image/reports_stack_image.png",
                                      waterMarkImage: "assets/stack_image/reports_watermark.png",
                                      stackImageLeft: 138,
                                      stackImageSize: 4,
                                      stackImageTop: 0,
                                      watermarkLeft: 0,
                                      
                                      watermarkTop: 5,
                                      text1: "Find your",
                                      text2: "Reports",
                                      borderRadius: 10,
                                      text_left:20,
                                      ontapp: (){
                                        // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              },
                                    ),
                         StackWidgets(
                                      containerHeight: 113,
                                      containerWidth: 250,
                                      text1Style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                                      text2Style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      containerColor: Color.fromARGB(255, 246, 191, 255),
                                      stackImage: "assets/stack_image/jobs_stack_image.png",
                                      waterMarkImage: "assets/stack_image/jobs_watermark.png",
                                      stackImageLeft: 115,
                                      stackImageSize: 4,
                                      stackImageTop: 0,
                                      watermarkLeft: 0,
                                      
                                      watermarkTop: 5,
                                      text1: "Find your",
                                      text2: "Jobs",
                                      borderRadius: 10,
                                      text_left:20,
                                      ontapp: (){
                                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              },
                                    ),
                        StackWidgets(
                                      containerHeight: 113,
                                      containerWidth: 250,
                                      text1Style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                                      text2Style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      containerColor: Color.fromARGB(255, 222, 255, 231),
                                      stackImage: "assets/stack_image/job_news_stack_image.png",
                                      waterMarkImage: "assets/stack_image/job_news_watermark.png",
                                      stackImageLeft: 120,
                                      stackImageSize: 4,
                                      stackImageTop: 0,
                                      watermarkLeft: 0,
                                      
                                      watermarkTop: 5,
                                      text1: "Find your",
                                      text2: "Job news",
                                      borderRadius: 10,
                                      text_left:20,
                                      ontapp: (){
                                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              },
                                    ),
                        StackWidgets(
                                      containerHeight: 113,
                                      containerWidth: 250,
                                      text1Style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                                      text2Style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      containerColor: Color.fromARGB(255, 253, 198, 185),
                                      stackImage: "assets/stack_image/quiz_stack_image.png",
                                      waterMarkImage: "assets/stack_image/quiz_watermark.png",
                                      stackImageLeft: 115,
                                      stackImageSize: 4,
                                      stackImageTop: 0,
                                      watermarkLeft: 0,
                                      
                                      watermarkTop: 5,
                                      text1: "Find your",
                                      text2: "Jobs",
                                      borderRadius: 10,
                                      text_left:20,
                                      ontapp: (){
                                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              },
                                    ),
                       
                      ],
                    ),
                  ),
                  StackWidgets(
                                      containerHeight: 130,
                                      containerWidth: double.infinity,
                                      text1Style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                                      text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                      containerColor: Color.fromARGB(255, 255, 234, 234),
                                      stackImage: "assets/stack_image/start_interview_stack_image.png",
                                      waterMarkImage: "assets/stack_image/start_interview_watermark.png",
                                      stackImageLeft: 140,
                                      stackImageSize:4,
                                      stackImageTop: 5,
                                      watermarkLeft: 0,
                                      
                                      watermarkTop: 10,
                                      text1: "Start your",
                                      text2: "Interview",
                                      borderRadius: 10,
                                      text_left:20,
                                      ontapp: (){
                                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                                                                              },
                                    ),

                  // ImageFeaturesButton(
                  //     imagepath:
                  //         "assets/Page_assets/Start_Interview_Button.png",
                  //     operation: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: ((context) => const Interview())));
                  //     }),
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

                  // StackWidgets(
                  //                     containerHeight: 130,
                  //                     containerWidth: double.infinity,
                  //                     text1Style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,fontFamily: "Inter"),
                  //                     text2Style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  //                     containerColor: Color.fromARGB(255, 245, 245, 245),
                  //                     stackImage: "assets/stack_image/faang_stack_image.png",
                  //                     waterMarkImage: "assets/stack_image/faang_watermark.png",
                  //                     stackImageLeft: 130/2,
                  //                     stackImageSize:4,
                  //                     stackImageTop: 30,
                  //                     watermarkLeft: 0,

                  //                     watermarkTop: 10,
                  //                     text1: "Start your",
                  //                     text2: "Interview",
                  //                     borderRadius: 10,
                  //                     text_left:20,
                  //                     ontapp: (){
                  //                       _showBottomAlertDialog(context);
                  //                                                             },
                  //                   ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        SnackbarHelper.showSnackbar(context, title: "Under Construction",
                                         message: "This page is under development you can expect this functionality in the next update",
                                          icon: Icons.error_outline, color: Colors.red);
                      },
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 245, 245, 245),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 98, 98, 98)
                                  .withOpacity(0.3), // Shadow color
                              spreadRadius:
                                  0.7, // How wide the shadow should be
                              blurRadius: 4, // How soft the shadow should be
                              offset:
                                  Offset(1, 2.5), // Changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Center(
                                child: Opacity(
                                  opacity: 1,
                                  child: Image.asset(
                                      "assets/stack_image/faang_watermark.png",
                                      scale: 3),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Image.asset(
                                  "assets/stack_image/faang_stack_image.png",
                                  scale: 3.5,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 90,
                              left: 110,
                              child: Text(
                                "Interview",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ImageFeaturesButton(
                  //     imagepath: "assets/Page_assets/FAANG Button.png",
                  //     operation: () {
                  //       _showBottomAlertDialog(context);
                  //     }),

                  //BOTTOM BOTTOM BOTTOM
                  const Text("Made with\nCare!",
                      style: TextStyle(
                          fontFamily: "Poppins",
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

                  //TODO :remove the comments after testing the app

                  // Row(
                  //   children: [
                  //     NameFeaturesButton(
                  //         imagepath: "assets/Page_assets/pugazh.png",
                  //         operation: () {
                  //           print("this is worlin");
                  //            showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return Git_insta_direct_box(
                  //                 github: 'https://github.com/pugazhmukilan',
                  //                 instagram: 'https://www.instagram.com/mukil_arena/',
                  //                 linkedin:'https://www.linkedin.com/in/pugazh-mukilan-922206251/',
                  //                 name: 'Pugazh Mukilan',
                  //               );
                  //             },
                  //           );
  
                  //         }),
                  //     NameFeaturesButton(
                  //         imagepath: "assets/Page_assets/Hemanthkumar.png",
                  //         operation: () {
                  //           showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return Git_insta_direct_box(
                  //                 github: 'https://github.com/Hemanth-Kumar-04',
                  //                 instagram: 'https://www.instagram.com/h_e_m_a_n_t_h04/',
                  //                 linkedin:'https://www.linkedin.com/in/hemanth-kumar-4b8471275/',
                  //                 name: 'Hemanth Kumar',
                  //               );
                  //             },
                  //           );
                  //         }),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     NameFeaturesButton(
                  //         imagepath: "assets/Page_assets/Tarun.png",
                  //         operation: () {
                  //           showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return Git_insta_direct_box(
                  //                 github: 'https://github.com/tarun-sakthivel',
                  //                 instagram: 'https://www.instagram.com/',
                  //                 linkedin:'https://www.linkedin.com/in/tarun-sakthivel-0b904a254/',
                  //                 name: 'Tarun',
                  //               );
                  //             },
                  //           );
                  //         }),
                  //     NameFeaturesButton(
                  //         imagepath: "assets/Page_assets/Karthik sagar.png",
                  //         operation: () {
                  //           showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return Git_insta_direct_box(
                  //                 github: 'https://github.com/karthiksagarN',
                  //                 instagram: 'https://www.instagram.com/karthik.sagarn/',
                  //                 linkedin:'https://www.linkedin.com/in/karthik-sagar-nallagula-3b1983285/',
                  //                 name: 'Karthik sagar',
                  //               );
                  //             },
                  //           );
                  //         }),
                  //   ],
                  // ),
                ]),
          ),
        ));
  }
}

// class FeaturesButton extends StatelessWidget {
//   late Color startcolor;
//   late Color endcolor;
//   late String subtext;
//   late String maintext;
//   late String imagepath;
//   late Function() operation;
//   FeaturesButton({
//     super.key,
//     required this.startcolor,
//     required this.endcolor,
//     required this.subtext,
//     required this.maintext,
//     required this.imagepath,
//     required this.operation,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: operation,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
//         child: Container(
//           width: 300,
//           height: 150,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [startcolor, endcolor],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               stops: const [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),
//             borderRadius: KMyborder,
//           ),

//           //content inside the container
//           child: Padding(
//             //giving padding to the whole row to maintain the text properly
//             padding: const EdgeInsets.fromLTRB(25, 18, 25, 18),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(subtext,
//                         style: const TextStyle(
//                             fontFamily: "Inter",
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black)),
//                     Text(maintext,
//                         style: const TextStyle(
//                             fontFamily: "Inter",
//                             fontSize: 32,
//                             fontWeight: FontWeight.w800,
//                             color: Color.fromARGB(255, 255, 255, 255))),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(),
//                 ),
//                 //container image
//                 Image.asset(imagepath),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void _showBottomAlertDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(7.0),
//         child: Container(
//           child: AlertDialog(
//             elevation: 40,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             buttonPadding: const EdgeInsets.all(5),
//             backgroundColor: Colors.black.withOpacity(0.6),
//             alignment: Alignment.bottomCenter,
//             title: const Text(
//               'This page is under construction',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                   color: Color.fromARGB(255, 255, 205, 23)),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

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
