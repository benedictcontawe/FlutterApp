import 'package:get_x/controllers/login_controller.dart';
import 'package:get_x/views/base_view.dart';
import 'package:get_x/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseView<LoginController> {
  
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.logDebug("LoginPage build");
    controller.initialized;
    controller.isClosed;
    return const Scaffold( body: LoginWidget(),);
  }

}
/*
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 151),
              // Welcome to Image
              Image.asset('assets/Logo_login.png'),

              SizedBox(height: 25),
              // Login to your account
              Text(
                'Login to your account',
                style:
                    GoogleFonts.poppins(fontSize: 15, color: Color(0xFF13235A)),
              ),

              SizedBox(height: 20),
              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 105.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PinCode()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade900,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4.0, 5.0),
                              blurRadius: 15.0,
                              spreadRadius: 5.0,
                            )
                          ]),
                      child: Center(
                        child: Text('Enter PIN',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      )),
                ),
              ),

              SizedBox(height: 220),

              // App version: xxxxx | Forgot PIN
              Text(
                'App Version. XXXXX | Forgot PIN',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFF13235A)),
              ),
            ],
          ),
        )));
  }

}
*/