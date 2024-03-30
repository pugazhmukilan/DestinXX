import 'package:destin/Constants/firebasefunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "Home.dart";
import 'Signuppage.dart';
import 'constants.dart';

final _auth = FirebaseAuth.instance;

/*GOOGLE AUTHENTICATION FIREBASE USING GOOGLE ACCOUNT*/
/*GOOGLE AUTHENTICATION FIREBASE USING GOOGLE ACCOUNT*/
/*GOOGLE AUTHENTICATION FIREBASE USING GOOGLE ACCOUNT*/
/*GOOGLE AUTHENTICATION FIREBASE USING GOOGLE ACCOUNT*/

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle() async {
  try {
    // Trigger the Google Sign-in flow
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    if (googleSignInAccount != null) {
      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Create a new credential using the Google ID token and access token
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Retrieve the user's email address
      final String? email = userCredential.user?.email;
      if (email != null) {
        print('User email: $email');

        // Now you can use the email address as needed, such as storing it in shared preferences or accessing user-specific data.

        // Example:
        UserName = await getUserName(email);
        print("++++++++++++++++++++++++++++++done");
        // Also, handle navigation or any other operations you need to perform after sign-in.
        // ...
      }
    }
  } catch (error) {
    print('Error signing in with Google: $error');
    // Handle sign-in errors here
  }
}

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  bool _obscureText = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            // if (screenwidth >900)
            /*Expanded(
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
                       Image(
                        
                        image: AssetImage('assets/image_assets/INTERVIEW2.png'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                       Text(
                        'INTERVIEW',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 147, 132, 1)),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 10,right:20,left:20),
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
                      
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom:20,left:30,right:30),
                        child: Center(
                          child: Text(
                            "Interviews forge prowess through intentional practice.",
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
                      )
                    ],
                  ),
                ),
              ),*/
            Expanded(
              flex: 5,
              child: Container(
                //The container for the whole workspace
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
                          tag: "destinxlogo",
                          child: Image(
                              image: AssetImage(
                                  'assets/logos/Mobile_firstPageLogo.png')),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          children: [
                            const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              //This is for the email in put textfield
                              height: 52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(232, 232, 232, 1),
                                  borderRadius: BorderRadius.circular(35)),
                              child: TextField(
                                controller: emailcontroller,
                                //onChanged: (value) =>  setState(() => emailcontroller = value),
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'PASSWORD',
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
                                  color: const Color.fromRGBO(232, 232, 232, 1),
                                  borderRadius: BorderRadius.circular(35)),
                              child: TextField(
                                controller: passwordcontroller,
                                //onChanged: (value) =>  setState(() => password = value),
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
                                        fontFamily: 'Inter', fontSize: 15),
                                    contentPadding: const EdgeInsets.all(20)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      /*GOOGLE SINGIN GOOGLE SIGNIN*/
                      /*GOOGLE SINGIN GOOGLE SIGNIN*/
                      /*GOOGLE SINGIN GOOGLE SIGNIN*/

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              await signInWithGoogle();

                              Navigator.pop(context);
                              print(
                                  "++++====================================================");
                              print(
                                  "++++====================================================");
                              print(
                                  "++++====================================================");
                              print("signing in using google");
                              print(
                                  "++++====================================================");
                              print(
                                  "++++====================================================");
                              print(
                                  "++++====================================================");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()));
                            } catch (e) {
                              Navigator.pop(context);
                              showErrorDialog(
                                  context, e.toString(), "Login Error");
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Error", content: "Can't able to Login check your email and password")));
                              print("error");
                            }
                            // Sign in failed
                          },
                          child: Image.asset(
                              "assets/image_assets/Google_auth_button.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(104, 250, 101, 91),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10),
                                    Text("logging in...",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              );
                            },
                          );

                          try {
                            print(emailcontroller.text);

                            await _auth.signInWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);

                            print("everthying went well");

                            //ading it in the sgared preference for the suto login
                            addemail(emailcontroller.text);
                            addpassword(passwordcontroller.text);

                            // print(emailcontroller.text);
                            //print( passwordcontroller.text);
                            UserID = emailcontroller.text;
                            //getthe username
                            UserName = await getUserName(UserID);

                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));

                            emailcontroller.clear();

                            passwordcontroller.clear();
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Congrulation", content: " You Successfully Logged In")));
                          } catch (e) {
                            Navigator.pop(context);
                            showErrorDialog(
                                context, e.toString(), "Login Error");
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Error", content: "Can't able to Login check your email and password")));
                            print("error");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 52, 52, 1),
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
                        padding: const EdgeInsets.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("don't have an account ?"),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  emailcontroller.clear();
                                  passwordcontroller.clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signuppage()));
                                },
                                child: const Text(
                                  "Click here",
                                  style: TextStyle(color: Colors.red),
                                )),
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

addemail(email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

addpassword(password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('password', password);
}
