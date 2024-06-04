


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackWidgets extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final String stackImage;
  final String waterMarkImage;
  final double stackImageSize;
  
  final double stackImageTop;
  final double stackImageLeft;
  final double watermarkTop;
  final double watermarkLeft;
  final String text1;
  final String text2;
  final TextStyle text1Style;
  final TextStyle text2Style;
  final Color containerColor;
  final double borderRadius;
  final Function ontapp;
  final double text_left;
  
  // Create a constructor
  const StackWidgets({super.key, 
    required this.containerHeight,
    required this.containerWidth,
    required this.stackImage,
    required this.waterMarkImage,
    required this.stackImageSize,
    
    required this.stackImageTop,
    required this.stackImageLeft,
    required this.watermarkTop,
    required this.watermarkLeft,
    required this.text1,
    required this.text2,
    required this.text1Style,
    required this.text2Style,
    required this.containerColor,
    required this.borderRadius,
    required this.ontapp,
    required this.text_left,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          ontapp();
      
        },
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: containerColor,
            boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.3), // Shadow color
                      spreadRadius: 0.7, // How wide the shadow should be
                      blurRadius: 4, // How soft the shadow should be
                      offset: const Offset(1, 2.5), // Changes position of shadow
                    ),
                    ],
          ),
          child: Stack(
            children: [
              Positioned(
                
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(waterMarkImage,
                  )),
              ),
              Positioned(
                top: stackImageTop,
                
                right: 0,
                child: Image.asset(
                  stackImage,
                  scale:stackImageSize
                ),
              ),
              Positioned(
                top: (containerHeight - (text1Style.fontSize ?? 0) - (text2Style.fontSize ?? 0)) / 2.5,
                left: text_left,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: text1Style,
                    ),
                    Text(
                      text2,
                      style: text2Style,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
