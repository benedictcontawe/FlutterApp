import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Obx( () {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("Loaded"));
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("${controller.list[index]['title']}"),
                    )
                  ],
                ),
              );
            }
          );
        }
      }, 
    );
  }
}