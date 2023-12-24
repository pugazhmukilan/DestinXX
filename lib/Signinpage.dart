import 'package:destin/firebasefunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "Home.dart";
import 'Signuppage.dart';
import 'constants.dart';



final _auth= FirebaseAuth.instance;


class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  late String email;
  late String password;
  bool _obscureText = true;
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
        backgroundColor: Kbackgroundcolor,
        body: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Row(
            children: [
              if (screenwidth >900)
              Expanded(
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
              ),
              Expanded(
                flex: 5,
                child: Container(
                  //The container for the whole workspace
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
                          height: 40,
                        ),
                        SizedBox(
                          //Email address text input textfield
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
                                    color: const Color.fromRGBO(232, 232, 232, 1),
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
                        screenwidth < 200
                            ? const Text(
                                'Allignment error',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              )
                            : SizedBox(
                                //Password text input textfield
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
                                          color: const Color.fromRGBO(
                                              232, 232, 232, 1),
                                          borderRadius: BorderRadius.circular(35)),
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
                                                fontFamily: 'Inter', fontSize: 15),
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
                          onPressed: () async{
                            
                          try{
                            
                          
                          final user = await _auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
                          // ignore: unnecessary_null_comparison
                          if (user != null){
                            print("everthying went well");

                            //ading it in the sgared preference for the suto login
                            addemail(emailcontroller.text);
                            addpassword(passwordcontroller.text);
                          
                            print(emailcontroller.text);
                            print( passwordcontroller.text);
                            UserID = emailcontroller.text;
                            //getthe username
                            UserName = await getUserName(UserID);
                            Navigator.pop(context);
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
                            
                            emailcontroller.clear();
                            
                            passwordcontroller.clear();
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Congrulation", content: " You Successfully Logged In")));
                            
                          }else{
                            showErrorDialog(context, "User Not found","Login Error");
                          }
                        }
                        catch(e){
                          print(e);
                          showErrorDialog(context, "Can't able to Login check your Email and password","Login Error");
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorDialog(title: "Error", content: "Can't able to Login check your email and password")));
                          print ("error");

                        }
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
                              Text("don't have an account ?"),
                             GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signuppage()));
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



 addemail(email) async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('email', email);
    }
    addpassword(password) async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('password', password);
    }