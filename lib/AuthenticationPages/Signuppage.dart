import 'package:destin/Constants/firebasefunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import "../Home.dart";
import '../constants.dart';
import "Signinpage.dart";

final _auth = FirebaseAuth.instance;
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  late String email = emailcontroller.text;
  late String password = passwordcontroller.text;
  late String name = usernamecontroller.text;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    //double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            //if (screenwidth >900)
            /* Expanded(
                //container for the left side of the page
                flex: 2,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Ksidebarcolor, borderRadius: KMyborder),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Image(
                        height: 320,
                        width: 260,
                        image: AssetImage('assets/image_assets/INTERVIEW2.png'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      screenwidth < 200
                          ? const Text(
                              ' ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            )
                          : const Text(
                              'INTERVIEW',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 147, 132, 1)),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 120,
                        width: 290,
                        child: screenwidth < 200
                            ? const Text(
                                ' ',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              )
                            : const Expanded(
                                child: Text(
                                  'Interviews, where practice breeds prowess. Elevate with intentional greatness. Craftsmanship honed in relentless pursuit. Dreams to reality, one answer at a time. Unleash your potential through deliberate practice. ',
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      color: Color.fromRGBO(182, 178, 178, 1),
                                      fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.justify,
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        //container for the text
                        child: Container(
                          child: Center(
                            child: screenwidth < 200
                                ? const Text(
                                    ' ',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 1,
                                        fontWeight: FontWeight.w400),
                                  )
                                : const Text(
                                    "Interviews forge prowess through \nintentional practice.",
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                          255,
                                          147,
                                          132,
                                          1,
                                        ),
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),*/
              Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Kdestinxwhite, borderRadius: KMyborder),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 240,
                          width: 350,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag:"destinxlogo",
                            child: Image(
                               
                                image: AssetImage('assets/logos/Mobile_firstPageLogo.png')),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left:20,right:20),
                          child: Column(
                            children: [
                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'NAME',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 60,
                                width: 380,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Kdestinxblack,width:2),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  controller: usernamecontroller,
                                  onChanged: (value) => name,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Name',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Inter', fontSize: 15),
                                      contentPadding: EdgeInsets.all(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20,right:20),
                          child: Column(
                            children: [
                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                //This is for the email in put textfield
                                height: 60,
                                width: 380,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Kdestinxblack,width:2),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  controller: emailcontroller,
                                  onChanged: (value) => email,
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Inter', fontSize: 15),
                                      contentPadding: EdgeInsets.all(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20,right:20),
                          child: Column(
                            children: [
                              const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'PASSWORD',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 65,
                                width: 380,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Kdestinxblack,width:2),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: TextField(
                                  controller: passwordcontroller,
                                  onChanged: (value) => password,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        //Icon button to add the visibility icon to the password textfield
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 15),
                                      contentPadding:
                                          const EdgeInsets.all(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: ()async {
                                            showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            backgroundColor: Color.fromARGB(104, 250, 101, 91),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.white,
                                  semanticsLabel: "hello",
                                ),
                                SizedBox(height: 10),
                                Text("Creating Account..."),
                              ],
                            ),
                          );
                        },
                      );
                      if (name.isEmpty){
                        showErrorDialog1(context, "UserName can't be empty!", "No UserName");
                        
                      }
                      else{
                      try{
                        
                       await createaccount(context,emailcontroller.text, passwordcontroller.text);
                      }
                      catch(e){
                        print(e);
                        showErrorDialog(context, e.toString(), "Signup Error");
                      }}
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(255, 52, 52,1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20
                                  ))),
                          child: const SizedBox(
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                              padding: const EdgeInsets.only(top:60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Already have an account ?"),
                                 GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signinpage()));
                                  },
                                  child: const Text("Click here",style: TextStyle(color: Colors.red),)),
                                ],
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
     
    );
  }
}

Future<void> createaccount(
    BuildContext context, String email, String password) async {
  try {
    addemail(email);
    addpassword(password);
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    addemail(emailcontroller.text);
    addpassword(passwordcontroller.text);

    emailcontroller.clear();
    passwordcontroller.clear();

    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
    showErrorDialog(context, "Successfully SignedUp", "Success");
    //TODO : implement the document creation method
    UserName =
        usernamecontroller.text; //first username is set intot he variable
    UserID =
        await getCurrentUserEmail(); //second UserID is set into the variable
    await addDocument(
        "Users", UserID, UserName); //adddoc is called to create a document
  } catch (e) {
    showErrorDialog1(context, "$e", "SignUp Error");
  }
}

class ErrorDialog1 extends StatelessWidget {
  final String title;
  final String content;

  const ErrorDialog1({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Kdestinxwhite,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorDialog1(BuildContext context, String errorMessage, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Signuppage())); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('OK'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}
