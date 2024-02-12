import 'package:flutter/material.dart';

import 'constants.dart';
//'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.',
class techinterviewPage extends StatefulWidget {
  const techinterviewPage({super.key});

  @override
  State<techinterviewPage> createState() => _techinterviewPageState();
}

class _techinterviewPageState extends State<techinterviewPage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kmainboard,
        appBar: AppBar(
        backgroundColor: Kmainboard,
        
        
        
        //automaticallyImplyLeading: false,
        title:Text("Tech Interview",style:Ktitletextstyle),
        
       ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children:[
              Image.asset("assets/image_assets/techpgimage.png",),
              Text("Overview",style:Ktitletextstyle)

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