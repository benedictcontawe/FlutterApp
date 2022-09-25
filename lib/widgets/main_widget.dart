import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Obx( () {
        if (controller.isLoading()) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.getLength(),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.network( 
                        controller.getImage(index),
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                      ),
                      dense: true,
                      title: Text("${controller.getTitle(index)}"),
                      subtitle: Text("${controller.getExplanation(index)}", maxLines: 2, overflow: TextOverflow.ellipsis,),
                      trailing: Column(
                        children: [
                          Text("${controller.getDate(index)}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black)),
                          Text("${controller.getCopyright(index)}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black)),
                        ]
                      ),
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