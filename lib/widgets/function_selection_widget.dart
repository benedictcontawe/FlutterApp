import 'package:get_x/controllers/functionselectioncontroller.dart';
import 'package:get_x/widgets/base_widget.dart';
import 'package:get_x/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FunctionSelectionWidget extends BaseWidget<FunctionSelectionController> {

  const FunctionSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(children: [
            Text(
              'Merchant App',
              style:
              GoogleFonts.poppins(fontSize: 25, color: Color(0xFF13235A),  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
            ),
           SizedBox(height: 50),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15.0),
             child: Row(
               mainAxisAlignment:  MainAxisAlignment.spaceBetween,
               children: [
                 // Loading
                    InkWell(
                      onTap: () { controller.launchLoading(); },
                      child: MyButtonWidget(
                        iconImagePath: 'assets/flutter.png',
                        buttonText: 'A',
                      ),
                    ),
                 // Balance Check
                 InkWell(
                   onTap: () { controller.launchBalanceCheck(); },
                   child: MyButtonWidget(
                     iconImagePath: 'assets/flutter.png',
                     buttonText: 'B',
                   ),
                 ),
                 // Retail Sale
                 InkWell(
                   onTap: () { controller.launchRetailSale(); },
                   child: MyButtonWidget(
                     iconImagePath: 'assets/flutter.png',
                     buttonText: 'C',
                   ),
                 ),
               ],
             ),
           )
          ],),
        ),
      );
  }
}