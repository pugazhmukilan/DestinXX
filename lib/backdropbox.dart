import 'dart:ui';

import 'package:destin/Constants/firebasefunctions.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

int currentIndex = 2;
TextEditingController Nametexteditor =
    TextEditingController(text: SavedName ?? '');
TextEditingController Introtexteditor =
    TextEditingController(text: Intro ?? '');
TextEditingController Skilltexteditor =
    TextEditingController(text: Skills ?? '');
TextEditingController Langtexteditor =
    TextEditingController(text: Language ?? '');
TextEditingController Exptexteditor =
    TextEditingController(text: Experience ?? '');
TextEditingController Edutexteditor =
    TextEditingController(text: Education ?? '');
TextEditingController Phonetexteditor =
    TextEditingController(text: Phone ?? '');
TextEditingController Emailtexteditor =
    TextEditingController(text: Email ?? '');

//USE THE SHARED PREFERENCE FILE TO SAME THE DATE LOCALLY NOW THEN WE CAN GO FOR THE DATABASE
String SavedName = '';
String Dob = '';
String Intro = '';
String Skills = '';
String Language = '';
String Experience = '';
String Education = '';
String Phone = '';
String Email = '';

class backdropfield extends StatefulWidget {
  String Title;
  TextEditingController textcontroller;
  String? hint_text;
  int max_lines;
  int max_length;
  double height;
  double width;
  String editor = "";

  backdropfield({
    required this.Title,
    required this.textcontroller,
    required this.hint_text,
    required this.max_lines,
    required this.max_length,
    required this.height,
    required this.width,
    required this.editor,
    super.key,
  });

  @override
  State<backdropfield> createState() => _backdropfieldState();
  static String inputretu() {
    return Experience;
  }
}

class _backdropfieldState extends State<backdropfield> {
  String Title = "";
  TextEditingController textcontroller = TextEditingController();
  String? hint_text = "";
  int? max_lines = 0;
  int? max_length = 800;
  double width = 100.0;
  double height = 100;

  String editor = "";

  @override
  void initState() {
    super.initState();
    editor = widget.editor;
    Title = widget.Title;
    hint_text = widget.hint_text;
    textcontroller = widget.textcontroller;
    setState(() {
      if (max_lines == 0) {
        max_lines = null;
        max_length = widget.max_length > 0 ? widget.max_length : null;
      } else if (max_length == 0) {
        max_length = null;
        max_lines = widget.max_lines > 0 ? widget.max_lines : null;
      } else {
        max_lines = widget.max_lines;
        max_length = widget.max_length > 0 ? widget.max_length : null;
      }
    });

    height = widget.height;
    width = widget.width;

    // Set initial state based on the value of 'i'
  }

  @override
  Widget build(BuildContext context) {
    //1.changed , r,4.hint_text 5.maxlines,6.maxlength,7.heigth,8.width

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              //color:const Color.fromARGB(7, 0, 0, 0),
              //color: Color.fromARGB(255, 239, 254, 239),
              //boxShadow: List.filled(3,BoxShadow(color: Color.fromARGB(60, 244, 67, 54),spreadRadius: 0.0,blurRadius: 10)),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 68, 68, 68),
              )),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 5, top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Title,
                    style: Kresumetextstyle,
                  ),
                  //TEXTEDITOR
                  const SizedBox(height: 2),
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: KMyborder,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: TextField(
                        controller: textcontroller,
                        onChanged: (value) {
                          textcontrollervalue(editor, value);
                        },
                        maxLength: max_length,
                        maxLines: max_lines,
                        // Allow unlimited lines in the text field
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove default border
                          hintText: hint_text,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void textcontrollervalue(String editor, String value) {
  if (editor == "Name") {
    SavedName = value;
    addFieldToUserDocument("UserName", SavedName);
  } else if (editor == "Email") {
    Email = value;
    addFieldToUserDocument("DBemail", Email);
  } else if (editor == "Phone") {
    Phone = value;
    addFieldToUserDocument("DBphone", Phone);
  } else if (editor == "Introduction") {
    Intro = value;
    addFieldToUserDocument("DBintro", Intro);
  } else if (editor == "Education") {
    Education = value;
    addFieldToUserDocument("DBeducation", Education);
  } else if (editor == "Skills") {
    Skills = value;
    addFieldToUserDocument("DBskills", Skills);
  } else if (editor == "Language") {
    Language = value;
    addFieldToUserDocument("DBlanguage", Language);
  } else if (editor == "Experience") {
    Experience = value;
    addFieldToUserDocument("DBexperience", Experience);
  }
}


