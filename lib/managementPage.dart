import 'package:flutter/material.dart';

import "Start_interview.dart";
import "Text_interview.dart";
import 'constants.dart';

class managementPage extends StatefulWidget {
  const managementPage({super.key});

  @override
  State<managementPage> createState() => _managementPageState();
}

class _managementPageState extends State<managementPage> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kbackgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child:Side(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Kmainboard, borderRadius: KMyborder),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                           Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Flexible>[
                                    const Flexible(
                                      child: SizedBox(
                                        height: 60,
                                        width: 900,
                                        child: Text(
                                         'Management Interview',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                    

                                    //This the place to place a dropdown box
                                  ],
                                ),
                          Container(
                            child: const Divider(
                              //This is used for creating a divider line
                              indent: 0,
                              endIndent: 0,
                              color: Color.fromARGB(255, 194, 194, 194),
                            ),
                          ),
                          const SizedBox(height: 10),
                         Container(
                                  child:screenWidth>900?
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Row for the image asset and the overview paragraph
                                     
                                      Expanded(child: Image.asset("assets/image_assets/management.png")),
                                       SizedBox(
                                        width: 120,
                                      ),

                                      Expanded(
                                        child: Container(
                                          child: Column(
                                                  //Column created for the overview headin g and the followin g paragraph
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Overview',
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 34,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Kblacktextcolor),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(15.0),
                                                      child: Text(
                                                        'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow',
                                                        style: TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Kblacktextcolor),
                                                            textAlign: TextAlign.justify,
                                                           
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 45,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      )
                                    ],
                                  )
                                    :Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         Image.asset("assets/image_assets/management.png"),
                                        SizedBox(
                                        height: 100,
                                      ),
                                       Container(
                                         child: Column(
                                                 //Column created for the overview headin g and the followin g paragraph
                                                 mainAxisAlignment:
                                                     MainAxisAlignment.start,
                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                                 children: [
                                                   Text(
                                                     'Overview',
                                                     style: TextStyle(
                                                         fontFamily: 'Inter',
                                                         fontSize: 34,
                                                         fontWeight:
                                                             FontWeight.w400,
                                                         color: Kblacktextcolor),
                                                   ),
                                                   const SizedBox(
                                                     height: 50,
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.all(15.0),
                                                     child: Text(
                                                       'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow',
                                                       style: TextStyle(
                                                           fontFamily: 'Inter',
                                                           fontSize: 18,
                                                           fontWeight:
                                                               FontWeight.w800,
                                                           color: Kblacktextcolor),
                                                           textAlign: TextAlign.justify,
                                                          
                                                     ),
                                                   ),
                                                   const SizedBox(
                                                     height: 45,
                                                   ),
                                                 ],
                                               ),
                                       ),
                                      ],
                                    ),
                                
                                ),
                          const SizedBox(
                            height: 55,
                          ),
                          const Text(
                            'Choose the interview type ?',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //BUTTONS ORDER FOR THE RESPONSIVE
                          //BUTTONS ORDER FOR THE RESPONSIVE
                          //BUTTONS ORDER FOR THE RESPONSIVE
                          screenWidth < 830
                              ?  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Container(
                                      //This is the conatiner that contains navigator button for the text based interview type
                                      child: MyElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Textinterview(type:"Management"))));
                                        },
                                        width:
                                            260, //Place to set the router to the text based page
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Text Based',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/image_assets/text.png'))
                                          ],
                                        ),
                                      ),
                                    ),
                                   SizedBox(
                                      //space between the two buttons
                                      height: 50,
                                    ),
                                    Container(
                                      //This is the container that contains the button for the voice and text navigator button
                                      child: MyElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Startinterview())));
                                        },
                                        width:
                                            260, //Place to set the router to the voice and text based page
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Video and Voice\nbased',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/image_assets/voice.png'))
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                            height: 15,
                          ),
                                ],
                              )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      //This is the conatiner that contains navigator button for the text based interview type
                                      child: MyElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Textinterview(type:"Management"))));
                                        },
                                        width:
                                            260, //Place to set the router to the text based page
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Text Based',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/image_assets/text.png'))
                                          ],
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      //space between the two buttons
                                      width: 50,
                                    ),
                                    Container(
                                      //This is the container that contains the button for the voice and text navigator button
                                      child: MyElevatedButton(
                                        onPressed: () {
                                         Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Startinterview())));
                                        },
                                        width:
                                            260, //Place to set the router to the voice and text based page
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Video and Voice\nbased',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    'assets/image_assets/voice.png'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          screenWidth < 840
                              ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 300,
                                    ),
                                    Text(
                                      'Recommended',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: 'Inter',
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                ],
                              )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                    ),
                                    Text(
                                      'Recommended',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: 'Inter',
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//class

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 100.0,
    this.gradient = const LinearGradient(colors: [
      Color.fromRGBO(225, 74, 85, 1),
      Color.fromRGBO(255, 56, 175, 1)
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromRGBO(255, 74, 85, 1),
              Color.fromRGBO(255, 56, 175, 1)
            ]),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}


/*'Transform your management role interviews with our state-of-the-art\n AI interview app! Effortlessly integrate a mix of general inquiries,\n fundamental projects, and strategic questions to holistically evaluate \ncandidates capabilities. Redefine your hiring approach for a \n                             leadership-driven tomorrow',*/
/* */