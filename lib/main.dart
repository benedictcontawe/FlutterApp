import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snackbar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text("Snackbar")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Show Snackbar"),
                onPressed: () {
                  Get.snackbar(
                      "Snackbar Title",
                      "This will be Snackbar Message",
                      snackPosition: SnackPosition.BOTTOM,
                      //titleText: Text("Another Title"),
                      //messageText: Text("Another Message", style: TextStyle(color: Colors.white),)
                      colorText: Colors.red,
                      backgroundColor: Colors.black,
                      borderRadius: 30,
                      margin: const EdgeInsets.all(10),
                      //maxWidth: 100,
                      animationDuration: const Duration(milliseconds: 3000),
                      //backgroundGradient: LinearGradient(colors: [Colors.red, Colors.green],),
                      borderColor: Colors.purple,
                      borderWidth: 4,
                      boxShadows: [
                        const BoxShadow(
                            color: Colors.yellow,
                            offset: Offset(30, 50),
                            spreadRadius: 20,
                            blurRadius: 8
                          )                      
                      ],
                      isDismissible: true,
                      dismissDirection: SnackDismissDirection.HORIZONTAL,
                      forwardAnimationCurve: Curves.bounceInOut,
                      duration: const Duration(milliseconds: 8000),
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      shouldIconPulse: false,
                      leftBarIndicatorColor: Colors.white,
                      mainButton: TextButton(
                        child: const Text("Retry"),
                        onPressed: () {
                          debugPrint("Retry Clicked");
                        },
                      ),
                      onTap: (val) {
                        debugPrint("Snackbar clicked");
                      },
                      overlayBlur: 5,
                      overlayColor: Colors.grey,
                      padding: const EdgeInsets.all(50),
                      showProgressIndicator: true,
                      progressIndicatorBackgroundColor: Colors.deepOrange,
                      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      reverseAnimationCurve: Curves.bounceInOut,
                      snackbarStatus: (val) {
                        debugPrint("$val");
                      },
                      userInputForm: Form(
                        child: Row(
                          children: const [
                            Expanded(
                              child: TextField()
                              )
                          ],
                        ),
                      )
                  );
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}