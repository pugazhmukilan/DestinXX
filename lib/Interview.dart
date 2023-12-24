import 'package:flutter/material.dart';

import 'constants.dart';
import 'designPage.dart';
import 'managementPage.dart';
import 'techinterviewPage.dart';
double screenWidth=0;
class Interview extends StatefulWidget {
  

  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
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
          Text("Interview",style:Ktitletextstyle),

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            
                              FeaturesButton(startcolor: Color.fromARGB(255, 242, 229, 95),
                                endcolor:Color.fromARGB(255, 244, 141, 190) ,
                                subtext: "Start your Interview",
                                maintext: "Technology",
                                imagepath:"assets/icon_assets/technology.png",
                                operation: (){
                                    //NAVIGATOR
                                    
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>techinterviewPage()));
                                }
                              ),
                              FeaturesButton(startcolor: Color.fromARGB(255, 138, 86, 249),
                                endcolor:Color.fromARGB(255, 89, 86, 253) ,
                                subtext: "Start your Interview",
                                maintext: "Management",
                                imagepath:"assets/icon_assets/managment.png",
                                operation: (){
                                  //NAVIGATOR
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>managementPage()));
                                }
                              ),
                              FeaturesButton(startcolor: Color.fromARGB(255, 249, 19, 19),
                                endcolor:Color.fromARGB(255, 249, 70, 167) ,
                                subtext: "Start your Interview",
                                maintext: "Design",
                                imagepath:"assets/icon_assets/design.png",
                                operation: (){
                                  //NAVIGATOR
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>designPage()));
                                }
                              ),
                              
                          ],
                        ),
                
                      ),
                   
                    
                 
                  ],
                )
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
