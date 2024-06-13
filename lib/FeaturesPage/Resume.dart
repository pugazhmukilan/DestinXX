import 'dart:typed_data';
import 'dart:ui';

import 'package:destin/AuthenticationPages/Signuppage.dart';
import 'package:destin/Constants/firebasefunctions.dart';
import 'package:destin/Home.dart';
import 'package:destin/InterviewPages/Interview.dart';
import 'package:destin/backdropbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

bool Resume_detail_collecting = false;
int currentIndex = 2;

//USE THE SHARED PREFERENCE FILE TO SAME THE DATE LOCALLY NOW THEN WE CAN GO FOR THE DATABASE

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  bool is_downloading = false;
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    //getResumeDetails(context);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Adjust the primary color if needed
            // Adjust the accent color if needed
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          // Create a new DateTime instance without the time part
          _dateTime = DateTime(value.year, value.month, value.day);
          Dob = _dateTime.toString();
          addFieldToUserDocument("DBdob", Dob);
        });
      }
    });
  }

  Uint8List? _image1;

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  chooseImages(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      return await image.readAsBytes();
    } else {
      return _showBottomAlertDialog(context);
    }
  }

  void selectImage() async {
    //have to set the bug for this  if I select the chood=seImage and come out without choosing the image
    try {
      Uint8List img = await chooseImages(ImageSource.gallery);

      setState(() {
        _image1 =
            img; //this will make tghe fn not null and galary will be opened
        saveProfile();
      });
    } catch (err) {}
  }

  void saveProfile() async {
    String resp = await saveData(file: _image1!);

    //addFieldToUserDocument('profilePic', resp); //Adding the image url into the profilepic field
    //print(resp);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int currentIndex = 2;

    //SELECTING THE DATE AND TIME

    TextEditingController Nametexteditor =
        TextEditingController(text: UserName ?? '');
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

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Kbackgroundcolor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedIconTheme: const IconThemeData(size: 22),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined), label: "Resume"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Accounts"),
        ],
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(
            () {
              currentIndex = newIndex;
              print("index is equal to+++++++ $currentIndex");
              if (currentIndex == 0) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
                setState(() {});
              } else if (currentIndex == 1) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Interview()));
              } else if (currentIndex == 2) {
              } else if (currentIndex == 3) {
                //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                _showBottomAlertDialog(context);
              }
            },
          );

          shape:
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
          );
        },
      ),
      backgroundColor: Kbackgroundcolor,
      appBar: AppBar(
        title: Text(
          "Resume",
          style: Ktitletextstyle,
        ),
        backgroundColor: Kdestinxwhite,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        opacity: 0.8,
                        image: AssetImage("assets/Page_assets/report_bg.png")),
                    color: Colors.white,
                  ), // THIS IS THE BOX DECORATION OF THE BACKGROUND OF THE RESUME
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(children: [
                                  CircleAvatar(
                                    backgroundImage: (() {
                                      try {
                                        if (_image1 != null) {
                                          return MemoryImage(_image1!)
                                              as ImageProvider;
                                        } else {
                                          // Display the default asset image when _image1 is null
                                          return NetworkImage(pic);
                                        }
                                      } catch (e) {
                                        print("Error loading image: $e");
                                        // Display the default asset image in case of an error
                                        return const AssetImage(
                                            'assets/image_assets/user_background.png');
                                      }
                                    })(),
                                    backgroundColor: Kgreycolor_light,
                                    radius: 50,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () async {
                                          selectImage();
                                          //setting the profile pic
                                        },
                                        icon: const Icon(
                                          Icons.add_a_photo_rounded,
                                          size: 25,
                                        ),
                                      ))
                                ]),
                                backdropfield(
                                    Title: "Name",
                                    textcontroller: Nametexteditor,
                                    hint_text: 'Enter your name',
                                    max_lines: 1,
                                    max_length: 0,
                                    height: 40,
                                    width: 180,
                                    editor: 'Name'),
                              ],
                            ),
                            const SizedBox(height: 10),

                            //NAME
                            //NAME
                            //NAME
                            //NAME

                            const SizedBox(height: 20),

                            Row(
                              children: [
                                ClipRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      height: 80,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              //HAVE TO CHECK
                                              "Date of Birth",
                                              style: Kresumetextstyle,
                                            ),
                                            Text(
                                              Dob,
                                              style: const TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 13,
                                                  color: Color.fromARGB(
                                                      255, 121, 121, 121),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                IconButton(
                                    onPressed: _showDatePicker,
                                    icon: Icon(Icons.calendar_month_sharp)),
                                const SizedBox(height: 20),
                              ],
                            ),

                            //ELEVATED BUTTON FOR PIVKING DATE WORKING FINE
                            //HAS SOME COMPLICATION WITH THE HOT RELOAD
                            //SO NOT USING FOR NOT

                            //DATE PICKER
                            const SizedBox(height: 20),
                            backdropfield(
                                editor: "Email",
                                Title: "Email",
                                textcontroller: Emailtexteditor,
                                hint_text: "Email..",
                                max_lines: 1,
                                max_length: 0,
                                height: 70,
                                width: 240),

                            const SizedBox(height: 20),
                            backdropfield(
                                editor: "Phone",
                                Title: "Phone",
                                textcontroller: Phonetexteditor,
                                hint_text: "Phone number...",
                                max_lines: 1,
                                max_length: 0,
                                height: 70,
                                width: 240),

                            const SizedBox(
                              height: 30,
                            ),

                            //INTRODUCTION
                            //INTRODUCTION
                            //INTRODUCTION
                            backdropfield(
                                editor: "Introduction",
                                Title: "Introduction",
                                textcontroller: Introtexteditor,
                                hint_text: "Here...",
                                max_lines: 0,
                                max_length: 500,
                                height: 240,
                                width: 400),

                            const SizedBox(height: 20),

                            //EDUCATION
                            //EDUCATION
                            //EDUCATION
                            //EDUCATION
                            backdropfield(
                                editor: "Education",
                                Title: "Education",
                                textcontroller: Edutexteditor,
                                hint_text: "Here",
                                max_lines: 0,
                                max_length: 600,
                                height: 340,
                                width: 400),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: backdropfield(
                                        Title: 'Skills',
                                        textcontroller: Skilltexteditor,
                                        hint_text: 'type your skills',
                                        max_lines: 0,
                                        max_length: 500,
                                        height: 240,
                                        width: 135,
                                        editor: 'Skills'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 8.0, bottom: 8.0),
                                    child: backdropfield(
                                        Title: 'Language',
                                        textcontroller: Langtexteditor,
                                        hint_text: 'Languages known',
                                        max_lines: 0,
                                        max_length: 500,
                                        height: 240,
                                        width: 135,
                                        editor: 'Language'),
                                  ),
                                ],
                              ),
                            ),

                            //EXPERIENCE
                            //EXPERIENCE
                            //EXPERIENCE
                            //EXPERIENCE

                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: backdropfield(
                                  Title: 'Experience',
                                  textcontroller: Exptexteditor,
                                  hint_text: 'Your experience in the field',
                                  max_lines: 0,
                                  max_length: 800,
                                  height: 240,
                                  width: 400,
                                  editor: 'Experience'),
                            ),

                            //SAVE BUTTON
                            //SAVE BUTTON
                            //SAVE BUTTON
                            //SAVE BUTTON

                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            is_downloading = true;
                                          });

                                          setState(() {
                                            is_downloading = false;
                                          });
                                        }, //HAVE TO ADD THE FILE SVAER AND THE LOCATION OF THE FILE SAVING IN THE PHYSICAL DEVICE
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 13, 12, 12),
                                        ),
                                        child: is_downloading
                                            ? CircularProgressIndicator(
                                                color: Kdestinxwhite,
                                              )
                                            : const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Download',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.download,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              )),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 3, 205, 10),
                                        minimumSize: const Size(125, 40),
                                        disabledForegroundColor:
                                            Colors.yellow.withOpacity(0.38),
                                        disabledBackgroundColor:
                                            Colors.yellow.withOpacity(0.12),
                                      ),
                                      onPressed: () async {
                                        //STORING THE ELEMENT IN THE SHAREDPREFEREENCE IN THE LOCAL STORGAE
                                        //STORING THE USERNAME

                                        addFieldToUserDocument(
                                            "UserName", Nametexteditor.text);
                                        addFieldToUserDocument(
                                            "DBeducation", Edutexteditor.text);
                                        addFieldToUserDocument(
                                            "DBexperience", Exptexteditor.text);
                                        addFieldToUserDocument(
                                            "DBemail", Emailtexteditor.text);
                                        addFieldToUserDocument(
                                            "DBphone", Phonetexteditor.text);
                                        addFieldToUserDocument(
                                            "DBintro", Introtexteditor.text);
                                        addFieldToUserDocument(
                                            "DBlanguage", Langtexteditor.text);
                                        addFieldToUserDocument(
                                            "DBskills", Skilltexteditor.text);
                                        addFieldToUserDocument("DBdob", Dob);
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )),
                                ]),
                          ],
                        ),
                      ))))
        ],
      ),
    );
    ;
  }
}

class typingfield extends StatelessWidget {
  typingfield({
    super.key,
    required this.editor,
    required this.h,
    required this.hinttext,
    required this.len,
    required this.function,
  });

  final TextEditingController editor;
  final double h;
  final String hinttext;
  final int len;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            height: h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 68, 68, 68),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: TextField(
                onChanged: function(),
                controller: editor,
                maxLength: len,
                maxLines: 30,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove default border
                  hintText: hinttext,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Date_element extends StatelessWidget {
  Date_element({
    super.key,
    required this.editor,
    required this.h,
    required this.w,
    required this.hinttext,
    required this.length,
  });

  late TextEditingController editor;
  late double h;
  late double w;
  late String hinttext;
  late int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          borderRadius: KMyborder,
          color: Kgreycolor_light,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: TextField(
            controller: editor,
            maxLength: length,
            maxLines: 1,
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
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: const Text(
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
    },
  );
}
