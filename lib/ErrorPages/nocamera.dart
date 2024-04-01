import "package:flutter/material.dart";
import "../constants.dart";

class Nocamera extends StatefulWidget {
  const Nocamera({super.key});

  @override
  State<Nocamera> createState() => _NocameraState();
}

class _NocameraState extends State<Nocamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          IconButton(onPressed: (){
            Navigator.pop(context);

          }, icon: const Icon(Icons.arrow_back_ios)),
        ],),
      ),

      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/image_assets/general_error.png"),height: 400,width:400),
          const SizedBox(
            height: 40,
          ),
          Text("Error occured",style: Ktitletextstyle,),
          Text("No camera found in your device connect camera\n or try text based interview for now \n or restart the app",style:Kcommontextstyle,textAlign: TextAlign.center,),
        ],
        ),
      )
    );
  }
}