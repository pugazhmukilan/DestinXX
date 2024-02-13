import 'package:flutter/material.dart';

import 'constants.dart';
//'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.',
class Interview_details_Page extends StatefulWidget {
  final int catid;
  final String maintext;
  final String context_text;
  final String imagepath;

 Interview_details_Page({required this.catid,required this.context_text,required this.maintext,required this.imagepath});

  @override
  State<Interview_details_Page> createState() => _Interview_details_PageState(catid:catid,context_text:context_text,maintext:maintext,imagepath:imagepath);
}

class _Interview_details_PageState extends State<Interview_details_Page> {
  final int catid;
  final String maintext;
  final String context_text;
  final String imagepath;

 _Interview_details_PageState({required this.catid,required this.context_text,required this.maintext,required this.imagepath});
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
              Image.asset(imagepath,),
              Text("Overview",style:Ktitletextstyle),
              SizedBox(
                height:10,
              ),
              Text(context_text,style:Kcommontextstyle),

            ]
          )
        )
        );
  }
}

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