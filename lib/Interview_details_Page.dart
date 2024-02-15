import 'package:destin/Start_interview.dart';
import 'package:destin/Text_interview.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
//'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.',
class Interview_details_Page extends StatefulWidget {
  final String type;
  final int catid;
  final String maintext;
  final String context_text;
  final String imagepath;

 Interview_details_Page({required this.catid,required this.context_text,required this.maintext,required this.imagepath,required this.type});

  @override
  State<Interview_details_Page> createState() => _Interview_details_PageState(catid:catid,context_text:context_text,maintext:maintext,imagepath:imagepath,type:type);
}

class _Interview_details_PageState extends State<Interview_details_Page> {
  final int catid;
  final String type;
  final String maintext;
  final String context_text;
  final String imagepath;

 // ignore: non_constant_identifier_names
 _Interview_details_PageState({required this.type,required this.catid,required this.context_text,required this.maintext,required this.imagepath});
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kmainboard,
        appBar: AppBar(
        backgroundColor: Kmainboard,
        
        
        
        //automaticallyImplyLeading: false,
        title:Text(maintext,style:Ktitletextstyle),
        
       ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children:[
              Image.asset(imagepath,height: 250,),
              Text("Overview",style:TextStyle(fontSize: 23,fontFamily: "inter",fontWeight: FontWeight.w600),textAlign: TextAlign.justify,),
              SizedBox(
                height:10,
              ),
              Padding(
                padding: const EdgeInsets.only(right:25,left:25),
                child: Text(context_text,style:TextStyle(fontSize: 14,fontFamily: "inter",fontWeight: FontWeight.w300),textAlign: TextAlign.justify,),
              ),

              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Textinterview(type: widget.type)));
                },
                child: Image.asset("assets/Page_assets/Textbased_interview.png",height:100),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Startinterview(type:widget.type)));
                
                  
                },
                child: Image.asset("assets/Page_assets/voicebased_interview.png",height:105),
              ),


            ]
          )
        )
        );
  }
}

