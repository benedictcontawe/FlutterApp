import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/CustomController.dart';
import 'package:get_x/routes/app_pages.dart';
import 'package:get_x/widgets/base_widget.dart';

class CustomWidget extends BaseWidget<CustomController> {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("1"),
                    const Text("+"),
                    const Text("2"),
                    const Text("="),
                    Obx((() => Text('${controller?.getSum()}'))),
                  ]
                ),
              )
            ),
            Expanded(
              child: Container(
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx((() => Text('${controller?.getSum()}'))),
                  ]
                ),
              )
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: Text("Hello")),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Next', style: TextStyle(fontSize: 20.0),),
                        onPressed: () {
                          debugPrint("Launch Sample App");
                          Get.toNamed(Routes.SPLASH, arguments: "Hello Login!"); //Get.toNamed(Routes.LOGIN);
                        },
                      )
                    ),
                    
                  ],
                ),
              )
            ),
          ],
    );
  }
}