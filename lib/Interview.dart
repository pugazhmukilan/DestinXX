import 'package:destin/HR_page.dart';
import 'package:destin/designPage.dart';
import 'package:destin/managementPage.dart';
import 'package:destin/techinterviewPage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Resume.dart';
import 'constants.dart';
double screenWidth=0;
int currentIndex = 1;
FocusNode _focusNode = FocusNode();
TextEditingController searchcontroller = TextEditingController();
class Interview extends StatefulWidget {
  
//TODO: implement search function for this page text file is ready 
  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  @override
 
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kmainboard,
       bottomNavigationBar:BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: Kbackgroundcolor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedIconTheme: IconThemeData(size:22),

        items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",),
            BottomNavigationBarItem(icon: Icon(Icons.meeting_room_outlined),label:"Interview"),
            BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined),label:"Resume"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label:"Accounts"),
          ],
        currentIndex: currentIndex,
        onTap: (int newIndex){
          setState(() {
            currentIndex=newIndex;
            print("index is equal to+++++++ ${currentIndex}");
            if (currentIndex ==0){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

            }
            else if ( currentIndex ==1 ){

              
            }
            else if (currentIndex == 2){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Resume()));

            }
            else if (currentIndex == 3){
              //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
              _showBottomAlertDialog(context);
            }

          },);


           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      );

          

        },
       
       ) ,
       appBar: AppBar(
        backgroundColor: Kmainboard,
        
        
        
        automaticallyImplyLeading: false,
        title:Text("Interview",style:Ktitletextstyle),
        bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.0), // Adjust the height as needed
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: searchcontroller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Search here...',
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              focusedBorder: OutlineInputBorder( 
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:BorderSide(color:Color.fromARGB(255, 29, 29, 29))),
              

            ),
             
          ),
        ),
      ),
       ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //TODO: apply the operations for the button
            ImageFeaturesButton(imagepath: "assets/Page_assets/Start_Interview_Technology.png", operation: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>techinterviewPage()));}),


            ImageFeaturesButton(imagepath: "assets/Page_assets/Start_Interview_Management.png", operation: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>managementPage()));
            }),
            ImageFeaturesButton(imagepath: "assets/Page_assets/Start_Interview_Design.png", operation: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>designPage()));
            }),
            ImageFeaturesButton(imagepath: "assets/Page_assets/Start_Interview_HR.png", operation: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>HRPage()));
            }),
          ]
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
            buttonPadding: EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.6),
            alignment: Alignment.bottomCenter,
            title: Text(
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
},);
}


class ImageFeaturesButton extends StatelessWidget {
  
  late String imagepath;
  late Function() operation;
  ImageFeaturesButton({
   
   required this.imagepath,
   required this.operation,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:operation,
      child: Image.asset(imagepath,height:145)
    );
  }
}