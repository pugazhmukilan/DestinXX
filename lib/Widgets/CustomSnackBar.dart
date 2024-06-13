
import "package:destin/constants.dart";
import "package:flutter/material.dart";

class SnackbarHelper {
  static void showSnackbar(BuildContext context,
      {required String title,
      required String message,
      required IconData icon,
      required Color color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(left:10, right: 10,bottom: 70),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            // color: Colors.black,
            color: Kdestinxblack.withOpacity(0.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                      //   style: GoogleFonts.poppins(
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w700,
                      //       color: Colors.black),
          
                      style:TextStyle(fontFamily: "Poppoins",
                      fontSize:15,
                      fontWeight: FontWeight.w700,
                      color:Kdestinxblack),
                       ),
          
                      Text(
                        message,
                        
                        style:TextStyle(fontFamily: "Poppoins",
                              fontSize:11,
                              fontWeight: FontWeight.w400,
                              color:Colors.grey.shade900,),
                      ),
                    ],
                  ),
                ),
                Icon(
                  icon,
                  color: color,
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}