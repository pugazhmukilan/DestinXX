import 'package:destin/InterviewPages/Start_interview.dart';
import 'package:destin/InterviewPages/Text_interview.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

//'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.',
class Interview_details_Page extends StatefulWidget {
  final String type;
  final int catid;
  final String maintext;
  final String context_text;
  final String imagepath;
  final String appbarimage;

  const Interview_details_Page(
      {super.key,
      required this.catid,
      required this.context_text,
      required this.maintext,
      required this.imagepath,
      required this.type,
      required this.appbarimage});

  @override
  State<Interview_details_Page> createState() => _Interview_details_PageState(
      catid: catid,
      context_text: context_text,
      maintext: maintext,
      imagepath: imagepath,
      type: type,
      appbarimage: appbarimage);
}

class _Interview_details_PageState extends State<Interview_details_Page> {
  final int catid;
  final String type;
  final String maintext;
  final String context_text;
  final String imagepath;
  final String appbarimage;

  // ignore: non_constant_identifier_names
  _Interview_details_PageState(
      {required this.type,
      required this.catid,
      required this.context_text,
      required this.maintext,
      required this.imagepath,
      required this.appbarimage});
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Image.asset(appbarimage, height: 200),

          //automaticallyImplyLeading: false,
          title: Text(maintext, style: Ktitletextstyle),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Image.asset(
                imagepath,
                height: 250,
              ),
              const Text(
                "Overview",
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: "inter",
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Text(
                  context_text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Textinterview(type: widget.type)));
                  },
                  child: Container(
                    decoration: BoxDecoration(color:Kdestinxblack,
                                borderRadius:BorderRadius.circular(15)),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("TextBased",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
                        Text("Interview",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w200)),
                      ],
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Startinterview(type: widget.type)));
                  },
                  child: Container(
                    height:60,
                    width: double.infinity,
                    decoration: BoxDecoration(color:Kdestinxblack,
                                borderRadius:BorderRadius.circular(15)),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("VideoBased",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
                        Text("Interview",style:TextStyle(fontSize: 10,fontWeight: FontWeight.w200)),
                      ],
                    )
                  ),
                ),
              ),
            ])));
  }
}
