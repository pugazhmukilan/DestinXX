import 'package:destin/firebasefunctions.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

//USE THE SHARED PREFERENCE FILE TO SAME THE DATE LOCALLY NOW THEN WE CAN GO FOR THE DATABASE
late String SavedName ='';
late String Date = "";
late String Month = "";
late String Year = '';
late String Intro = '';
late String Skills = '';
late String Language = '';
late String Experience = '';
late String Education = '';
class Resume extends StatefulWidget {
  
  @override
  State<Resume> createState() => _ResumeState();
  
}

class _ResumeState extends State<Resume> {
DateTime _dateTime = DateTime.now();
@override
  void initState() {
    
    getResumeDetails();
    


    
  }
/*void _showDatePicker() {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
    initialDatePickerMode: DatePickerMode.day, // Set the mode to select only the day
  ).then((value) {
    if (value != null) {
      setState(() {
        _dateTime = DateTime(value.year, value.month, value.day);
      });
    }
  });
}*/
  
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    
 //SELECTING THE DATE AND TIME

    TextEditingController Nametexteditor = TextEditingController(text: SavedName != null ? SavedName:'');
    TextEditingController Introtexteditor = TextEditingController(text: Intro != null ? Intro:'');
    TextEditingController Skilltexteditor = TextEditingController(text: Skills != null ? Skills:'');
    TextEditingController Langtexteditor = TextEditingController(text: Language != null ? Language:'');
    TextEditingController Exptexteditor = TextEditingController(text: Experience != null ? Experience:'');
    TextEditingController Edutexteditor = TextEditingController(text: Education != null ? Education:'');
    TextEditingController Datetexteditor = TextEditingController(text: Date != null ? Date:'');
    TextEditingController Monthtexteditor = TextEditingController(text: Month != null ? Month:'');
    TextEditingController Yeartexteditor = TextEditingController(text: Year != null ? Year:'');
    
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [

            
           Expanded(
            
            flex:1,
            child:Side(),
           ),
           Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                
                decoration: BoxDecoration(color: Kmainboard,borderRadius: KMyborder),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                    children: [
                      Text("Resume", style: Ktitletextstyle),
                      Divider(
                        indent: 0,
                        endIndent: 0,
                        color: Kgreylinecolor,
                      ),
                      Expanded(
                        child:
                        Container(
                        width:double.infinity,
                        color:Colors.transparent,
                        child:SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics:BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                           
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:50),
                                      child: Column(
                                    
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [CircleAvatar(
                                          backgroundColor: Kgreycolor_light,
                                          radius:100,
                                        ),
                                        SizedBox(height:30),
                                        ElevatedButton(
                                                                      
                                        style: ElevatedButton.styleFrom(backgroundColor: Kgreycolor_light,
                                        minimumSize: Size(50, 30),
                                        ),
                                        onPressed: ()async{
                                      //setting the profile pic 
                                                                  
                                                                  
                                      },
                                                                    
                                    child: Text("Change image",style: TextStyle(fontFamily: "Inter",
                                        fontSize: 10,fontWeight: FontWeight.w600,
                                        color:Colors.purple),)),
                                        
                                        
                                        ]
                                      ),
                                    ),
                                    
                
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text("Name",style:Kresumetextstyle,),
                                    //TEXTEDITOR
                                    SizedBox(
                                      height:10
                                    ),

                                    //NAME
                                    //NAME
                                    //NAME
                                    //NAME
                                       Container(
                                        height:40,
                                        width: 500,
                                        decoration: BoxDecoration(borderRadius: KMyborder,color: Kgreycolor_light,),
                                        
                                         child: Padding(
                                           padding: const EdgeInsets.only(left: 15,bottom:5),
                                           child: TextField(
                                            controller: Nametexteditor,
                                            maxLines:1, // Allow unlimited lines in the text field
                                            decoration: InputDecoration(
                                              border: InputBorder.none, // Remove default border
                                              hintText: 'Type your Name...',
                                            ),
                                         ),
                                         ),
                                       ),
                                       SizedBox(
                                      height:10
                                    ),
                                    Text("Date of Birth",style:Kresumetextstyle,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Date_element(editor: Datetexteditor, h: 60, w: 80, hinttext: "Date",length:2),
                                        Date_element(editor: Monthtexteditor, h: 60, w: 80, hinttext: "Month",length:2),
                                        Date_element(editor: Yeartexteditor, h: 60, w: 80, hinttext: "Year",length:4),
                                      ],
                                    ),
                                    SizedBox(
                                    height: 40,
                                  ),
                                    Row(
                                      children:[ ]
                                    ),
                                    SizedBox(
                                    height: 40,
                                  ),
                                  //ELEVATED BUTTON FOR PIVKING DATE WORKING FINE
                                  //HAS SOME COMPLICATION WITH THE HOT RELOAD 
                                  //SO NOT USING FOR NOT  
                                 /*ElevatedButton(
                                  
                                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 106, 6),
                                  minimumSize: Size(70, 40),
                                  onSurface: Colors.red,),
                                  onPressed: (){
                                      _showDatePicker();
                              
                                },
                                
                              child: Text("Choose Date",style: TextStyle(fontFamily: "Inter",
                                fontSize: 13,fontWeight: FontWeight.w600,
                                color:Colors.white),)),*/
                                   
                                    //DATE PICKER
                                    ],
                                   )
                
                
                                  ],
                                ),
                              ),
                              SizedBox(
                                    height: 40,
                                  ),
                              
                              //INTRODUCTION AND EDUCATION COLUMN  
                              ////INTRODUCTION AND EDUCATION COLUMN  
                              /////INTRODUCTION AND EDUCATION COLUMN  
                                
                              Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                  //INTRODUCTION
                                  //INTRODUCTION
                                  //INTRODUCTION

                                   Text("Introduction",style:Kresumetextstyle,),
                                   //TEXTEDITOR
                                   SizedBox(
                                     height:10
                                   ),
                                     typingfield(editor: Introtexteditor,h:150,hinttext: "Here...",len:500),
                
                                    //EDUCATION 
                                    //EDUCATION
                                    //EDUCATION
                                    //EDUCATION
                                    Text("Education",style:Kresumetextstyle,),
                                   //TEXTEDITOR
                                   SizedBox(
                                     height:10
                                   ),
                                    typingfield(editor: Edutexteditor,h:300,hinttext: "Here...",len:600),
                                   ],
                               ),


                               //LANGUGE AND SKILLS ROW
                                //LANGUGE AND SKILLS ROW
                                 //LANGUGE AND SKILLS ROW
                              Row(
                                children: [

                                  //SKILLS
                                  //SKILLS
                                  //SKILLS
                                  //SKILLS

                                  Expanded(
                                    flex:1,
                                    child: Container(
                                     
                                      width:100,
                                      
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Text("Skills",style:Kresumetextstyle,),
                                   //TEXTEDITOR
                                          SizedBox(
                                            height:10
                                          ),
                                            typingfield(editor: Skilltexteditor,h:200,hinttext: "Here...",len:500),

                                        ],
                                      ),
                                    ),
                                  ),

                                  //LANGUAGE
                                  //LANGUAGE
                                  //LANGUAGE
                                  //LANGUAGE
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                     
                                      width:100,
                                      
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Text("Language",style:Kresumetextstyle,),
                                   //TEXTEDITOR
                                          SizedBox(
                                            height:10
                                          ),
                                            typingfield(editor: Langtexteditor,h:200,hinttext: "Here...",len:500),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE

                              Text("Experience",style:Kresumetextstyle,),
                                   //TEXTEDITOR
                                   SizedBox(
                                     height:10
                                   ),
                                  typingfield(editor: Exptexteditor,h:200,hinttext:"here...",len:800),


                            //SAVE BUTTON
                            //SAVE BUTTON
                            //SAVE BUTTON
                            //SAVE BUTTON
                              Center(
                                child: ElevatedButton(
                                  
                                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 3, 205, 10),
                                  minimumSize: Size(200, 80),
                                  onSurface: Colors.yellow,),
                                  onPressed: ()async{
                                    //STORING THE ELEMENT IN THE SHAREDPREFEREENCE IN THE LOCAL STORGAE 
                                    //STORING THE USERNAME
                                   
                                    
                                    addFieldToUserDocument( "UserName", Nametexteditor.text);
                                    addFieldToUserDocument( "DBeducation", Edutexteditor.text);
                                    addFieldToUserDocument( "DBexperience", Exptexteditor.text);
                                    
                                    addFieldToUserDocument( "DBintro", Introtexteditor.text);
                                    addFieldToUserDocument( "DBlanguage", Langtexteditor.text);
                                    addFieldToUserDocument( "DBskills", Skilltexteditor.text);
                                    addFieldToUserDocument( "DBmonth", Monthtexteditor.text);
                                    addFieldToUserDocument( "DBdate", Datetexteditor.text);
                                    addFieldToUserDocument( "DByear", Yeartexteditor.text);
                              
                                },
                                
                              child: Text("Save",style: TextStyle(fontFamily: "Inter",
                                fontSize: 20,fontWeight: FontWeight.w600,
                                color:Colors.white),)),
                              ),
                               
                              
                            ],
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          ]
        )));}}

class typingfield extends StatelessWidget {
  typingfield({
    
    required this.editor,
    required this.h,
    required this.hinttext,
    required this.len,
  });

  late TextEditingController editor;
  late  double h;
  late String hinttext;
  late int len;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom:10,right:8,left:8),
      child: Container(
         height:h,
         width: double.infinity,
         decoration: BoxDecoration(borderRadius: KMyborder,color: Kgreycolor_light,),
         
          child: Padding(
            padding: const EdgeInsets.only(left: 15,bottom:5),
            child: TextField(
             controller: editor,
             maxLength: len,
             maxLines:null,
              // Allow unlimited lines in the text field
             decoration: InputDecoration(
               border: InputBorder.none, // Remove default border
               hintText: 'Here...',
             ),
               ),
         ),
       ),
    );
  }
}


class Date_element extends StatelessWidget {
  Date_element({
    
    required this.editor,
    required this.h,
    required this.w,
    required this.hinttext,
    required this.length,

  });

  late TextEditingController editor;
  late  double h;
  late double w;
  late String hinttext;
  late int length;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom:10,right:8,left:8),
      child: Container(
         height:h,
         width: w,
         decoration: BoxDecoration(borderRadius: KMyborder,color: Kgreycolor_light,),
         
          child: Padding(
            padding: const EdgeInsets.only(left: 15,bottom:5),
            child: TextField(
             controller: editor,
             maxLength: length,
             maxLines:1,
             /* onChanged: (text) {
    // Handle the onChanged event if needed
    print("Entered text: $text");
  },*/ // Allow unlimited lines in the text field
             decoration: InputDecoration(
               border: InputBorder.none, // Remove default border
               hintText: hinttext,

             ),
               ),
         ),
       ),
    );
  }
}




Future<void> getResumeDetails()async{
  SavedName =  await getFieldFromUserDocument("UserName");
  Date =  await getFieldFromUserDocument("DBdate");
  Month =  await getFieldFromUserDocument("DBmonth");
  Year =  await getFieldFromUserDocument("DByear");
  Intro =  await getFieldFromUserDocument("DBintro");
  Skills =  await getFieldFromUserDocument("DBskills");
  Language =  await getFieldFromUserDocument("DBlanguage");
  Experience =  await getFieldFromUserDocument("DBexperience");
  Education =  await getFieldFromUserDocument("DBeducation");
  print(SavedName);
  print(Date);
  print(Month);
  print(Skills);
}