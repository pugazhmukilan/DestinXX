import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:destin/AuthenticationPages/Signuppage.dart';
import 'package:destin/Home.dart';
import 'package:destin/InterviewPages/Interview.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:destin/backdropbox.dart';
import 'package:destin/Constants/firebasefunctions.dart';
import 'package:destin/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Center(child: Text("Resume", style: Ktitletextstyle)),
        ),
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
                  setState(() {});
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
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/Page_assets/Report_page.png")),
                color: Colors.white,
              ), // THIS IS THE BOX DECORATION OF THE BACKGROUND OF THE RESUME
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                  children: [
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Stack(children: [
                                                CircleAvatar(
                                                  backgroundImage: (() {
                                                    try {
                                                      if (_image1 != null) {
                                                        return MemoryImage(
                                                                _image1!)
                                                            as ImageProvider;
                                                      } else {
                                                        // Display the default asset image when _image1 is null
                                                        return NetworkImage(
                                                            pic);
                                                      }
                                                    } catch (e) {
                                                      print(
                                                          "Error loading image: $e");
                                                      // Display the default asset image in case of an error
                                                      return const AssetImage(
                                                          'assets/image_assets/user_background.png');
                                                    }
                                                  })(),
                                                  backgroundColor:
                                                      Kgreycolor_light,
                                                  radius: 50,
                                                ),
                                                Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      65)),
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          selectImage();
                                                          //setting the profile pic
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .add_a_photo_rounded,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ))
                                              ]),
                                            ),
                                            const SizedBox(height: 10),
                                          ]),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 50),
                                        backdropfield(
                                          editor: "Name",
                                          Title: "Name",
                                          textcontroller: Nametexteditor,
                                          hint_text: "Type your name..",
                                          max_lines: 1,
                                          max_length: 0,
                                          height: 80,
                                          width: 180,
                                        ),
                                        //TEXTEDITOR
                                        const SizedBox(height: 10),

                                        //NAME
                                        //NAME
                                        //NAME
                                        //NAME

                                        const SizedBox(height: 20),

                                        ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 2, sigmaY: 2),
                                            child: Container(
                                              height: 80,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
                                    backdropfield(
                                        editor: "Email",
                                        Title: "Email",
                                        textcontroller: emailcontroller,
                                        hint_text: "Email..",
                                        max_lines: 1,
                                        max_length: 0,
                                        height: 80,
                                        width: 240),

                                    const SizedBox(height: 20),
                                    backdropfield(
                                        editor: "Phone",
                                        Title: "Phone",
                                        textcontroller: Phonetexteditor,
                                        hint_text: "Phone number...",
                                        max_lines: 1,
                                        max_length: 0,
                                        height: 80,
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
                                        child: backdropfield(
                                            editor: "Skills",
                                            Title: "Skills",
                                            textcontroller: Skilltexteditor,
                                            hint_text: "Here...",
                                            max_lines: 0,
                                            max_length: 500,
                                            height: 240,
                                            width: 100)),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    //LANGUAGE
                                    //LANGUAGE
                                    //LANGUAGE
                                    //LANGUAGE\

                                    Expanded(
                                        flex: 1,
                                        child: backdropfield(
                                            editor: "Language",
                                            Title: "Language",
                                            textcontroller: Langtexteditor,
                                            hint_text: "Here...",
                                            max_lines: 0,
                                            max_length: 500,
                                            height: 240,
                                            width: 100)),
                                  ],
                                ),
                              ),

                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE
                              //EXPERIENCE

                              const SizedBox(height: 10),
                              backdropfield(
                                  editor: "Experience",
                                  Title: "Experience",
                                  textcontroller: Exptexteditor,
                                  hint_text: "Here...",
                                  max_lines: 0,
                                  max_length: 800,
                                  height: 240,
                                  width: 400),

                              //SAVE BUTTON
                              //SAVE BUTTON
                              //SAVE BUTTON
                              //SAVE BUTTON
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        downloadFile();
                                      }, //HAVE TO ADD THE FILE SVAER AND THE LOCATION OF THE FILE SAVING IN THE PHYSICAL DEVICE
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(60, 40),
                                        maximumSize: const Size(220, 40),
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
                                      )),

                                  /* Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
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
                                
                                              addFieldToUserDocument("UserName",
                                                  Nametexteditor.text);
                                              addFieldToUserDocument(
                                                  "DBeducation",
                                                  Edutexteditor.text);
                                              addFieldToUserDocument(
                                                  "DBexperience",
                                                  Exptexteditor.text);
                                              addFieldToUserDocument("DBemail",
                                                  Emailtexteditor.text);
                                              addFieldToUserDocument("DBphone",
                                                  Phonetexteditor.text);
                                              addFieldToUserDocument("DBintro",
                                                  Introtexteditor.text);
                                              addFieldToUserDocument("DBlanguage",
                                                  Langtexteditor.text);
                                              addFieldToUserDocument("DBskills",
                                                  Skilltexteditor.text);
                                              addFieldToUserDocument(
                                                  "DBdob", Dob);
                                
                                              pic = await getUrlFromUserDocument(
                                                  "ProfilePic");
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
                                      
                                    ],
                                  ),*/
                                ),
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

Future<void> saveAsPdf() async {
  final String text = Nametexteditor.text;
  final pdf = pw.Document();
  final Directory? directory = await getExternalStorageDirectory();
  final File file = File('${directory?.path}/$UserName resume.pdf');

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(text),
        );
      },
    ),
  );
  final Uint8List fontData = File('open-sans.ttf').readAsBytesSync();
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  await file.writeAsBytes(await pdf.save());
}

void downloadFile() async {
  var time = DateTime.now().millisecondsSinceEpoch;
  var path = "/storage/emulated/0/Download/image-$time.jpg";
  var file = File(path);
  var res = await get(Uri.parse(
      "data:image/jpeg;base64,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"));
  file.writeAsBytes(res.bodyBytes);
}
