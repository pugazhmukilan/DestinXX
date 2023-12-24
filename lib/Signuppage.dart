import 'package:destin/firebasefunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import "Home.dart";
import "Signinpage.dart";
import 'constants.dart';
final _auth= FirebaseAuth.instance;
TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController usernamecontroller=TextEditingController();


class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  late String email;
  late String password;
  late String name;
  bool _obscureText = true;
  

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
        backgroundColor: Kbackgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              if (screenwidth >900)
              Expanded(
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
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Kmainboard, borderRadius: KMyborder),
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
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/image_assets/signin.png')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        screenwidth <
                                100 // The conditions to avoid the render overflow of the Name textfield
                            ? const Text(
                                'Allignment error',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              )
                            : SizedBox(
                                height: 90,
                                width: 400,
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
                                      height: 52,
                                      width: 380,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              232, 232, 232, 1),
                                          borderRadius: BorderRadius.circular(35)),
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
                        screenwidth < 100
                            ? const Text(
                                'Allignment error',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ) //This is condition used to avoid the render overflow of the email textfield
                          
                            : SizedBox(
                                height: 90,
                                width: 400,
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
                                      height: 52,
                                      width: 380,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              232, 232, 232, 1),
                                          borderRadius: BorderRadius.circular(35)),
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
                        screenwidth <
                                100 //This is the condition used to avoid the render overflow of the following password textfield
                            ? const Text(
                                'Allignment error',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              )
                            : SizedBox(
                                height: 84,
                                width: 400,
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
                                    Expanded(
                                      child: Container(
                                        height: 52,
                                        width: 380,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                232, 232, 232, 1),
                                            borderRadius:
                                                BorderRadius.circular(35)),
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
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 10),
                                Text("Creating Account..."),
                              ],
                            ),
                          );
                        },
                      );
                       await createaccount(context,emailcontroller.text, passwordcontroller.text);
                      
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(172, 118, 243, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const SizedBox(
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
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
                                  Text("Already have an account ?"),
                                 GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signinpage()));
                                  },
                                  child: Text("Click here",style: TextStyle(color: Colors.red),)),
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




Future<void> createaccount(BuildContext context, String email, String password) async {
  try {
    addemail(email);
    addpassword(password);
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (newUser != null) {
      print("Registered correctly");
      addemail(emailcontroller.text);
      addpassword(passwordcontroller.text);
                          
                           
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home()));
          showErrorDialog(context, "Successfully SignedUp", "Success");
      //TODO : implement the document creation method 
      UserName = usernamecontroller.text;//first username is set intot he variable
      UserID = await getCurrentUserEmail();//second UserID is set into the variable
      await addDocument("Users",UserID,UserName);//adddoc is called to create a document
    }
    else{
      showErrorDialog(context,"Signup Failed","Failed to signUp.");
    }
  } catch (e) {
    showErrorDialog(context, "${e}", "SignUp Error");
    
  }
}