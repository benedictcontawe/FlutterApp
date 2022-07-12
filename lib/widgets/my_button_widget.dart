import 'package:get_x/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonWidget extends BaseWidget {

  const MyButtonWidget({Key? key, required this.iconImagePath, required this.buttonText,}) : super(key: key);

  final String iconImagePath;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        InkWell(

          child: Container(
            height: 80,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 10,

                  ),
                ]
            ),
            child: Center(

              child: Image.asset(iconImagePath),

            ),

          ),
        ),

        SizedBox(height: 10,),
        //text

        Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}