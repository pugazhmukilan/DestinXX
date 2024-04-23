import 'package:destin/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Git_insta_direct_box extends StatelessWidget {
  Git_insta_direct_box({super.key,
  required this.github,
  required this.instagram,
  required this.linkedin,
  required this.name});

  late String github;
  late String instagram ;
  late String linkedin;
  late String name;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        
        backgroundColor:Kdestinxblack,
        content: SizedBox(
          height:230,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "JetBrainsMono",
                                    color:Colors.white,
                                  ),
                                ),
              const Divider(
                indent:10,
                endIndent: 10,
              ),
              const SizedBox(height: 10,),
                  
              Social_media_info(media_logo: 'assets/logos/GitHub logo.png',media_name:'GitHub' ,link:github),
              Social_media_info(media_logo: 'assets/logos/linkedin logo.png',media_name:'Linkedin' ,link:linkedin),
              Social_media_info(media_logo: 'assets/logos/instagram-icon logo.png',media_name:'Instagram' ,link:instagram),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Social_media_info extends StatelessWidget {
   Social_media_info({
    super.key,
    required this.media_name,
    required this.media_logo,
    required this.link,
  });
  late String media_logo;
  late String media_name;
  late String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: (){
          print("hi");
          _launchUrl(link);
        },
        child: Container(
          decoration: BoxDecoration(border: Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(media_logo,height:30),
                const SizedBox(width:20),
                Text(media_name,style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "JetBrainsMono",
                                color:Colors.white,
                              ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
Future<void> _launchUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}