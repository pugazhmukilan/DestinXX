import 'dart:typed_data';

import 'package:destin/Home.dart';
import 'package:destin/Interview.dart';
import 'package:destin/Signuppage.dart';
import 'package:destin/firebasefunctions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'constants.dart';

int currentIndex = 2;

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


class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    getResumeDetails();
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
          items: const [
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
                      setState(() {
                        
                      });
                } else if (currentIndex == 1) {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Interview()));
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
        body: Row(children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration:
                  BoxDecoration(color: Kmainboard, borderRadius: KMyborder),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  children: [
                    Center(child: Text("Resume", style: Ktitletextstyle)),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      color: Kgreylinecolor,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
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
                                      padding: const EdgeInsets.only(
                                          top: 45, right: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
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
                                                  print(
                                                      "Error loading image: $e");
                                                  // Display the default asset image in case of an error
                                                  return AssetImage(
                                                      'assets/image_assets/user_background.png');
                                                }
                                              })(),
                                              backgroundColor: Kgreycolor_light,
                                              radius: 45,
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Kgreycolor_light,
                                                  minimumSize:
                                                      const Size(30, 30),
                                                ),
                                                onPressed: () async {
                                                  selectImage();
                                                  //setting the profile pic
                                                },
                                                child: const Text(
                                                  "Change image",
                                                  style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.purple),
                                                )),
                                            /* ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Kgreycolor_light,
                                                  minimumSize:
                                                      const Size(30, 30),
                                                ),
                                                onPressed: () async {
                                                  saveProfile();
                                                  //setting the profile pic
                                                },
                                                child: const Text(
                                                  "Upload image",
                                                  style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.purple),
                                                )),*/
                                          ]),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50),
                                          child: Text(
                                            "Name",
                                            style: Kresumetextstyle,
                                          ),
                                        ),
                                        //TEXTEDITOR
                                        const SizedBox(height: 10),

                                        //NAME
                                        //NAME
                                        //NAME
                                        //NAME
                                        Container(
                                          height: 40,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: KMyborder,
                                            color: Kgreycolor_light,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, bottom: 5),
                                            child: TextField(
                                              controller: Nametexteditor,
                                              onChanged: (value) {
                                                SavedName = value;
                                              },
                                              maxLines:
                                                  1, // Allow unlimited lines in the text field
                                              decoration: const InputDecoration(
                                                border: InputBorder
                                                    .none, // Remove default border
                                                hintText: 'Type your Name...',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),

                                        Text(
                                          "Date of Birth",
                                          style: Kresumetextstyle,
                                        ),

                                        Container(
                                          height: 40,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Kgreycolor_light,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            Dob,
                                            style: const TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 121, 121, 121),
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ),
                                        const SizedBox(height: 12),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 106, 6),
                                              minimumSize: const Size(70, 40),
                                              disabledForegroundColor:
                                                  Colors.red.withOpacity(0.38),
                                              disabledBackgroundColor:
                                                  Colors.red.withOpacity(0.12),
                                            ),
                                            onPressed: () {
                                              _showDatePicker();
                                            },
                                            child: const Text(
                                              "Choose Date",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            )),

                                        const SizedBox(height: 20),

                                        //ELEVATED BUTTON FOR PIVKING DATE WORKING FINE
                                        //HAS SOME COMPLICATION WITH THE HOT RELOAD
                                        //SO NOT USING FOR NOT

                                        //DATE PICKER
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              //INTRODUCTION AND EDUCATION COLUMN
                              ////INTRODUCTION AND EDUCATION COLUMN
                              /////INTRODUCTION AND EDUCATION COLUMN

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: Kresumetextstyle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: KMyborder,
                                          color: Kgreycolor_light,
                                        ),
                                        height: 40,
                                        width: 240,
                                        child: Center(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: TextField(
                                            controller: emailcontroller,
                                            onChanged: (value) {
                                              Email = value;
                                            },
                                            maxLines: 1,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Email..."),
                                          ),
                                        )),
                                      ),
                                    ),

                                    const SizedBox(height: 20),
                                    Text(
                                      "Phone",
                                      style: Kresumetextstyle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: KMyborder,
                                          color: Kgreycolor_light,
                                        ),
                                        height: 40,
                                        width: 240,
                                        child: Center(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: TextField(
                                            controller: Phonetexteditor,
                                            onChanged: (value) {
                                              Phone = value;
                                            },
                                            maxLines: 1,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Phone number..."),
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    //INTRODUCTION
                                    //INTRODUCTION
                                    //INTRODUCTION

                                    Text(
                                      "Introduction",
                                      style: Kresumetextstyle,
                                    ),
                                    //TEXTEDITOR
                                    const SizedBox(height: 10),

                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: KMyborder,
                                        color: Kgreycolor_light,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 5),
                                        child: TextField(
                                          controller: Introtexteditor,
                                          onChanged: (value) {
                                            Intro = value;
                                          },
                                          maxLength: 500,
                                          maxLines: null,
                                          // Allow unlimited lines in the text field
                                          decoration: const InputDecoration(
                                            border: InputBorder
                                                .none, // Remove default border
                                            hintText: 'Here...',
                                          ),
                                        ),
                                      ),
                                    ),
                                    //EDUCATION
                                    //EDUCATION
                                    //EDUCATION
                                    //EDUCATION
                                    Text(
                                      "Education",
                                      style: Kresumetextstyle,
                                    ),
                                    //TEXTEDITOR
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: KMyborder,
                                        color: Kgreycolor_light,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 5),
                                        child: TextField(
                                          controller: Edutexteditor,
                                          onChanged: (value) {
                                            Education = value;
                                          },
                                          maxLength: 600,
                                          maxLines: null,
                                          // Allow unlimited lines in the text field
                                          decoration: const InputDecoration(
                                            border: InputBorder
                                                .none, // Remove default border
                                            hintText: 'Here...',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //LANGUGE AND SKILLS ROW
                              //LANGUGE AND SKILLS ROW
                              //LANGUGE AND SKILLS ROW
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    //SKILLS
                                    //SKILLS
                                    //SKILLS
                                    //SKILLS

                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Skills",
                                              style: Kresumetextstyle,
                                            ),
                                            //TEXTEDITOR
                                            const SizedBox(height: 10),
                                            Container(
                                              height: 200,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: KMyborder,
                                                color: Kgreycolor_light,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 5),
                                                child: TextField(
                                                  controller: Skilltexteditor,
                                                  onChanged: (value) {
                                                    Skills = value;
                                                  },
                                                  maxLength: 500,
                                                  maxLines: null,
                                                  // Allow unlimited lines in the text field
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove default border
                                                    hintText: 'Here...',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    //LANGUAGE
                                    //LANGUAGE
                                    //LANGUAGE
                                    //LANGUAGE
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Language",
                                              style: Kresumetextstyle,
                                            ),
                                            //TEXTEDITOR
                                            const SizedBox(height: 10),
                                            Container(
                                              height: 200,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: KMyborder,
                                                color: Kgreycolor_light,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 5),
                                                child: TextField(
                                                  controller: Langtexteditor,
                                                  onChanged: (value) {
                                                    Language = value;
                                                  },
                                                  maxLength: 500,
                                                  maxLines: null,
                                                  // Allow unlimited lines in the text field
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove default border
                                                    hintText: 'Here...',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE

                              const SizedBox(height: 10),
                              Text(
                                "Experience",
                                style: Kresumetextstyle,
                              ),
                              //TEXTEDITOR
                              const SizedBox(height: 10),
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: KMyborder,
                                  color: Kgreycolor_light,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 5),
                                  child: TextField(
                                    controller: Exptexteditor,
                                    onChanged: (value) {
                                      Experience = value;
                                    },
                                    maxLength: 800,
                                    maxLines: null,
                                    // Allow unlimited lines in the text field
                                    decoration: const InputDecoration(
                                      border: InputBorder
                                          .none, // Remove default border
                                      hintText: 'Here...',
                                    ),
                                  ),
                                ),
                              ),

                              //SAVE BUTTON
                              //SAVE BUTTON
                              //SAVE BUTTON
                              //SAVE BUTTON
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: ElevatedButton(
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
                                          addFieldToUserDocument("DBeducation",
                                              Edutexteditor.text);
                                          addFieldToUserDocument("DBexperience",
                                              Exptexteditor.text);
                                          addFieldToUserDocument(
                                              "DBemail", Emailtexteditor.text);
                                          addFieldToUserDocument(
                                              "DBphone", Phonetexteditor.text);
                                          addFieldToUserDocument(
                                              "DBintro", Introtexteditor.text);
                                          addFieldToUserDocument("DBlanguage",
                                              Langtexteditor.text);
                                          addFieldToUserDocument(
                                              "DBskills", Skilltexteditor.text);
                                          addFieldToUserDocument("DBdob", Dob);

                                          pic = await getUrlFromUserDocument("ProfilePic");
                                          /*addFieldToUserDocument(
                                              "profilePic", _image1.toString());*/
                                        },
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(135, 40),
                                        backgroundColor: const Color.fromARGB(
                                            255, 13, 12, 12),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                      ))
                                ],
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
        ]));
  }
}

class typingfield extends StatelessWidget {
  typingfield({
    super.key,
    required this.editor,
    required this.h,
    required this.hinttext,
    required this.len,
  });

  late TextEditingController editor;
  late double h;
  late String hinttext;
  late int len;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
      child: Container(
        height: h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: KMyborder,
          color: Kgreycolor_light,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: TextField(
            controller: editor,
            maxLength: len,
            maxLines: null,
            // Allow unlimited lines in the text field
            decoration: const InputDecoration(
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

Future<void> getResumeDetails() async {
  SavedName = await getFieldFromUserDocument("UserName");
  Dob = await getFieldFromUserDocument("DBdob");
  Email = await getFieldFromUserDocument("DBemail");
  Phone = await getFieldFromUserDocument("DBphone");
  Intro = await getFieldFromUserDocument("DBintro");
  Skills = await getFieldFromUserDocument("DBskills");
  Language = await getFieldFromUserDocument("DBlanguage");
  Experience = await getFieldFromUserDocument("DBexperience");
  Education = await getFieldFromUserDocument("DBeducation");
  pic = await getUrlFromUserDocument("ProfilePic");
  //print(pic);
  //print(Phone);
  //print(Skills);
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
