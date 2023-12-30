import 'package:flutter/material.dart';

import 'Quizpage.dart';
import 'constants.dart';
double screenWidth=0;
class Quiztypes extends StatefulWidget {
  

  @override
  State<Quiztypes> createState() => _QuiztypesState();
}

class _QuiztypesState extends State<Quiztypes> {
  @override
 
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [

            
           Expanded(
            flex:1,
            child: Side(),
           ),
           Expanded(
            flex:4,
            child: Container(
                height:double.infinity,
                decoration: BoxDecoration(color:Kmainboard,
                borderRadius: KMyborder),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quiztypes",style:Ktitletextstyle),

          Divider(
           indent: 0,
           endIndent: 0,
           color: Kgreylinecolor,
          ),

          Expanded(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics:BouncingScrollPhysics() ,
                child:Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Text("Techinical",style: Kquizcattext,),
                        Divider(
                          indent: 5,
                          endIndent:5 ,
                          color: Kquizlinecolor
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  qtype(operation:() {
                                    Navigator.pop(context);
                                   //Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingPage1(category: "Technical", subcategory: "Java"))));
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingAndQuizPage(category: "Technical", subcategory: "Java"))));
                                  
                                  },
                                  
                                  name: "Java",),


                                  qtype(operation:() {
                                    Navigator.pop(context);
                                    //Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingPage1(category: "Technical", subcategory: "C++"))));
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingAndQuizPage(category: "Technical", subcategory: "C++"))));
                                  
                                  },
                                  
                                  name: "C++",),

                                  qtype(operation:() {
                                    Navigator.pop(context);
                                   // Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingPage1(category: "Technical", subcategory: "Java"))));
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => LoadingAndQuizPage(category: "Technical", subcategory: "Python"))));
                                  
                                  },
                                  
                                  name: "Python"),
                                  
                                ],)
                              ],
                            ),
                          )),


                        Text("Management",style: Kquizcattext,),
                        Divider(
                          indent: 5,
                          endIndent:5 ,
                          color: Kquizlinecolor,
                        ),


                        Text("Design",style:Kquizcattext,),
                        Divider(
                          indent: 5,
                          endIndent:5 ,
                          color: Kquizlinecolor
                        ),


                        Text("HR",style:Kquizcattext,),
                        Divider(
                          indent: 5,
                          endIndent:5 ,
                          color: Kquizlinecolor
                        ),

                      ],

                      

                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
                ),
                
              ),
           ),
          ],
        ),
      )
    );
  }
}

class qtype extends StatelessWidget {
  late String name;
  late Function()  operation;
   qtype({
    super.key,
    required this.name,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: operation,
      child: Container(
        width:50,
        height:50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color.fromARGB(255, 227, 232, 255)),
        
        child:  Center(child: Text(name,style: TextStyle(fontFamily: "jetBrainsMono",fontSize: 15,fontWeight: FontWeight.w300),))),
    );
  }
}

// ignore: must_be_immutable


class FeaturesButton extends StatelessWidget {
  late Color startcolor;
  late Color endcolor;
  late String subtext;
  late String maintext;
  late String imagepath;
  late Function() operation;
  FeaturesButton({
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
      onTap:operation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Container(
          
          width: 400,
          height:150,
          decoration: BoxDecoration(
            
            gradient: LinearGradient(colors: [startcolor, endcolor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,),
          borderRadius: BorderRadius.circular(20),

          
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
                    Text(subtext,style:TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: Colors.black)),
                    Text(maintext,style:TextStyle(fontSize:32,fontWeight: FontWeight.w800,color: const Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
                Expanded(
                  child: Container(
                
                  ),
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


int _getCrossAxisCount(BuildContext context) {
    // Calculate the number of columns based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int columns = screenWidth ~/ 150; // Adjust the width as needed

    // Ensure a minimum of 1 column
    return columns > 0 ? columns : 1;
  }
