import 'package:flutter/material.dart';

import "Signinpage.dart";
import "Signuppage.dart";
import 'constants.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Kbackgroundcolor,
        
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(

            children: [
              //if (screenwidth >900)
             /* Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  
                  decoration: BoxDecoration(
                      color: Ksidebarcolor, borderRadius: KMyborder),
                  child: SingleChildScrollView(
                    child: Column(
                      
                      children: [
                         Image(
                          image: AssetImage('assets/image_assets/grow.png'),
                        ),
                         Text(
                          'PRACTICE',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 147, 132, 1)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:40,right:40,top:20,bottom:20),
                          child: Text(
                            'Practice transforms potential into prowess, turning dreams into reality.Craftsmanship is born from a relentless dance with improvement. As we step into interviews, ',
                            style: TextStyle(
                                wordSpacing: 2,
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Color.fromRGBO(182, 178, 178, 1),
                                fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                         const Center(
                            child: Text(
                              " greatness is cultivated through intentional practice.",
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                    255,
                                    147,
                                    132,
                                    1,
                                  ),
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                            ),
                          ),
                      
                      ],
                    ),
                  ),
                ),
              ),*/
              Expanded(
                //flex: 5,
                child: Container(
                  height:double.infinity,
                 decoration: BoxDecoration(color: Kmainboard,borderRadius: KMyborder),

                 child:SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                         const SizedBox(
                          height:50
                         ),
                           const Padding(
                             padding: EdgeInsets.only(left:60,right:60,bottom:50),
                             child: Hero(
                              transitionOnUserGestures: true,
                              tag:"destinxlogo",
                               child: Image(
                                  image: AssetImage('assets/logos/Mobile_firstPageLogo.png')),
                             ),
                           ),
                          SizedBox(
                                  //Container for the alignment of the following statement and the sigin page router button
                                 
                                  child: Column(
                                    children: [
                                       const SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                         child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'if',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        225, 255, 114, 94)),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '(You have an account?){',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Inter"),
                                              ),
                                            ]),
                                       ),
                                       const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Signinpage()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color.fromRGBO(
                                                232, 232, 232, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30))),
                                        child: const SizedBox(
                                          height: 40,
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              'Signin',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'else',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(255, 114, 94, 1)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '{',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 const Signuppage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(232, 232, 232, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  child: const SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        'Signup',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                               
                              ],
                            ),
                          )
                        ],
                      ),
                 ),
                  ),
                )
              
            ],
          ),
        ),
      
    );
  }
}