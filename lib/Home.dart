import 'package:destin/Resume.dart';
import 'package:flutter/material.dart';

import 'Interview.dart';
import "constants.dart";
import "firebasefunctions.dart";
import "main.dart";
double screenWidth=0;
int currentIndex = 0;
class Home extends StatefulWidget {
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   ScrollController _scrollController = ScrollController();
   @override
   void initState(){
    super.initState();
    setdetails();

   }

   Future<void> setdetails()async{
    UserID = prefs!.getString("email").toString();
                            //getthe username
    UserName = await getUserName(UserID);
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

            }
            else if ( currentIndex ==1 ){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Interview()));
            }
            else if (currentIndex == 2){
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
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset("assets/logos/Mobile_LoginPageLogo.png",height:45),
            Image.asset("assets/logos/Mobile_firstPgeText.png",height:15),
          ],
        ),
       ),

      
     body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics:BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right:20,left:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        
          //HEADER HEADER HEADER
          children: [
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Expanded(
                  flex:3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       
                        
                        Text("Hello...\u{1F44B}",style:Kcommontextstyle),
                        Text(UserName,style: Ktitletextstyle,)
                          
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromARGB(255, 218, 218, 218),
                    
                  ),
                )
              ]
        
        
        
            ),
           
          SizedBox(
            height:30
          ),
          //FEATURES FEATURES FEATURES
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageFeaturesButton(imagepath: "assets/Page_assets/Reports_Button.png", operation: (){
                  print("pressing the find your reports");
                }),

                ImageFeaturesButton(imagepath: "assets/Page_assets/Jobs_Button.png", operation: (){
                  print("pressing the find your reports");
                }),

                ImageFeaturesButton(imagepath: "assets/Page_assets/Job_News.png", operation: (){
                  print("pressing the find your reports");
                }),

              ],
            ),
          ),
          
          ImageFeaturesButton(imagepath: "assets/Page_assets/Start_Interview_Button.png", operation: (){}),
          
          
          
          //BOTTOM BOTTOM BOTTOM
          Text("Made with\nCare!",style:TextStyle(fontFamily: "inter",fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 163, 74, 246))),
          SizedBox(height:10),
          Text("Coded with love by\nus for you!",style:TextStyle(fontFamily: "jetBrainsMono",fontWeight: FontWeight.bold,fontSize: 15,color: Color.fromARGB(255, 123, 123, 123))),
          Row(
            children: [
                NameFeaturesButton(imagepath: "assets/Page_assets/pugazh.png", operation: (){}),
                NameFeaturesButton(imagepath: "assets/Page_assets/Hemanthkumar.png", operation: (){}),
            ],
          )
          
          ]
        
         
          
        ),
      ),
     
     )
     
    );
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
          
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            
            gradient: LinearGradient(colors: [startcolor, endcolor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,),
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
                    Text(subtext,style:TextStyle(fontFamily:"Inter" ,fontSize:18,fontWeight: FontWeight.w400,color: Colors.black)),
                    Text(maintext,style:TextStyle(fontFamily:"Inter",fontSize:32,fontWeight: FontWeight.w800,color: const Color.fromARGB(255, 255, 255, 255))),
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
class NameFeaturesButton extends StatelessWidget {
  
  late String imagepath;
  late Function() operation;
  NameFeaturesButton({
   
   required this.imagepath,
   required this.operation,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:operation,
      child: Image.asset(imagepath,height:10)
    );
  }
}