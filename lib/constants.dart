import "dart:async";

import "package:destin/firebasefunctions.dart";
import 'package:flutter/material.dart';

import "Home.dart" ;
import "Interview.dart";
import "Resume.dart";


double screenWidth = 0;
late String UserName ;
late String UserID;
String projectName  = "ProjectX";
Color  Kbackgroundcolor = const Color.fromARGB(255, 29, 29, 29);
Color  Ksidebarcolor =  const Color.fromARGB(255, 29, 29, 29);
Color  Kmainboard = Color.fromARGB(255, 255, 255, 255);
Color Kblacktextcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kgreycolor_dark = Color.fromARGB(255, 161, 161, 161);
Color Kgreycolor_light = const Color.fromARGB(255, 242, 246, 249);
Color Kgreylinecolor = const Color.fromARGB(255, 194, 194, 194);
Color Kgreytextcolor = const Color.fromARGB(255, 186, 171, 171);
Color Kprogressbarbackgroundcolor = Color.fromARGB(255, 230, 230, 230);
TextStyle Ktitletextstyle = const TextStyle(fontFamily: "Inter",fontSize: 30,fontWeight: FontWeight.bold);
TextStyle Kcommontextstyle = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight:FontWeight.w500);
TextStyle Kresumetextstyle = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight:FontWeight.w800,color: Color.fromARGB(255, 104, 103, 103));
TextStyle Kprogressbarnumber = const TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight: FontWeight.w800,color: Colors.black);
TextStyle Kreporttextstyle = const  TextStyle(fontFamily: "Inter",fontWeight: FontWeight.w400,color: Colors.black,fontSize: 23);
//profile image for the user 
//picking the image from the file using the some modules

BorderRadius KMyborder = BorderRadius.circular(10);




class Side_bar_element extends StatelessWidget {

  late String name;
  late String imagelink;
  
  late Function() operation;
  Side_bar_element({required this.name,
   required this .imagelink,
  
   required this.operation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: operation,
        child: Container(
          
          color: Colors.transparent,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              
             Container(
              width:30,
              height:30,
              color: Colors.transparent,
              child: Center(child: Image(image: AssetImage(imagelink)))),
             SizedBox(
              width:50,
             ),
             Text(name,style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Kgreytextcolor,fontFamily: "Inter"))
          ],),
        ),
      ),
    );
  }
}




class Side extends StatefulWidget {
  const Side({super.key});

  @override
  State<Side> createState() => _SideState();
}

class _SideState extends State<Side> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
                height:double.infinity,
                decoration: BoxDecoration(color:Ksidebarcolor,
                borderRadius: KMyborder,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text(projectName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Kgreytextcolor),),
                      
                      
                      Padding(
                        padding: const EdgeInsets.only(left:10,top:15,bottom:15),
                        child: Image.asset("assets/logos/Desktop_logoNtext.png"),
                      ),
                    
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Kgreytextcolor,
                        radius: 40,
                        backgroundImage: AssetImage("assets/icon_assets/UserDefaultIcon.png",),
                      
                      ),
                      SizedBox(
                        height:10,
                      ),
                      Text( UserName,style:TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight: FontWeight.bold,color:Kgreytextcolor)),
                      Text("Free plan",style:TextStyle(fontFamily: "Inter",fontSize: 10,fontWeight: FontWeight.w300,color:Kgreytextcolor)),
                
                      SizedBox(
                        height:40,
                      ),

                      Container(
                        child: Scrollbar(
                          
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Side_bar_element(name: "Dashboard",imagelink:"assets/icon_assets/home_icon.png",operation: (){
                            print("Interview");
                            Navigator.pop(context);//POPPING THE CURRENT PAGE AND NAVIGATING TO NEEW
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                            }),
                                              
                            Side_bar_element(name:"Quizs",imagelink:"assets/icon_assets/dev_icon.png",operation: (){
                            print("Developers");
                                                }),
                            Side_bar_element(name:"Interview",imagelink:"assets/icon_assets/tie_side_icon.png",operation: (){
                            print("INterview");
                            setState(() {
                             Navigator.pop(context);
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview()));
                            });
                                                }),
                            Side_bar_element(name:"Resume",imagelink:"assets/icon_assets/resume_icon.png",operation: (){
                            print("Resume");
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Resume()));
                                                }),
                          
                              ],
                            ),
                          ),
                        ),
                      ),
                     SizedBox(height:350
                     ,),
                    
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(bottom:10),
                            child: GestureDetector(
                              onTap: (){

                              },

                              child:Text("Delete Account",style:TextStyle(fontFamily: "Inter",fontSize: 17,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 93, 93, 93)),textAlign: TextAlign.center,),
                            )

                          ),
                          
                          GestureDetector(
                        onTap: (){
                          signOut(context);
                        },
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                        
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                
                                Padding(
                                  padding: const EdgeInsets.only(right:10),
                                  child: Text("Sign out",style:TextStyle(fontFamily: "Inter",fontSize: 17,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 93, 93, 93))),
                                ),
                                
                                Image.asset("assets/icon_assets/signout.png"),
                            
                              ],
                            ),
                          ),
                        ),
                        
                     
                       
                     ),


                        ],
                      )    
                        
                    ],
                  ),
                ),
                
              );
  }
}




class ErrorDialog extends StatelessWidget {
  final String title;
  final String content;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Kmainboard,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage,String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.red),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
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
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            child: Text('OK'),
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




void showBottomPopup(BuildContext context, String message) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
    borderRadius:BorderRadius.circular(30)),
  anchorPoint: Offset.fromDirection(1),
    useSafeArea: false,
    isScrollControlled: true,
    
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                ),
                Text(
              message,
              style: TextStyle(fontSize: 18.0),
            ),
              ],
            ),
            
            
          ],
        ),
      );
    },
  );

  // Automatically close the bottom sheet after 4 seconds
  Timer(Duration(seconds: 2), () {
    Navigator.of(context).pop();
  });
}

