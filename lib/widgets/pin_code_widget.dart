import 'package:get_x/controllers/pin_code_controller.dart';
import 'package:get_x/widgets/base_widget.dart';
import 'package:get_x/widgets/text_field_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PinCodeWidget extends BaseWidget<PinCodeController> {

  const PinCodeWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                    color: Colors.indigo.shade900,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/flutter.png',
                ),
              ),
              Text(
                'Login to your account',
                style: GoogleFonts.poppins(fontSize: 15, color: Color(0xFF13235A),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter PIN code",
                style: GoogleFonts.poppins(
                  fontSize: 15, color: Color(0xFF13235A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldOTP(textEditingController: controller.firstOtpController, first: true, last: false),
                        TextFieldOTP(textEditingController: controller.secondOtpController, first: false, last: false),
                        TextFieldOTP(textEditingController: controller.thirdController, first: false, last: false),
                        TextFieldOTP(textEditingController: controller.fourthController, first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {  
                          controller.launchHome();
                          controller.setLoading();
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo.shade900),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Obx((() => controller.observeLoading().isTrue ? CircularProgressIndicator(color: Colors.white,strokeWidth: 3) : Text(
                            'Verify',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Forgot PIN?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
/*
class PinCode extends StatefulWidget {
  const PinCode({Key? key}) : super(key: key);

  @override
  _pincodeState createState() => _pincodeState();
}

class _pincodeState extends State<PinCode> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                    color: Colors.indigo.shade900,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/Logo_login.png',
                ),
              ),
              Text(
                'Login to your account',
                style: GoogleFonts.poppins(fontSize: 15, color: Color(0xFF13235A),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter PIN code",
                style: GoogleFonts.poppins(
                  fontSize: 15, color: Color(0xFF13235A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 2),(){
                            setState(() {
                              isLoading = false;
                            });
                          });
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo.shade900),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: isLoading? CircularProgressIndicator(color: Colors.white,strokeWidth: 3): Text(
                            'Verify',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Forgot PIN?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TextFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF13235A)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
*/