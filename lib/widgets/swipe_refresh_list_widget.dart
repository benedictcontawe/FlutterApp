import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class SwipeRefreshListWidget extends BaseWidget<MainController> {

  const SwipeRefreshListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator (
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () {
        return controller.fetchAPOD();
      },
      child: ListView.builder (
        itemCount: controller.getLength(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.android),
                  dense: true,
                  title: Text("${controller.getTitle(index)}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  trailing: Column(
                    children: [
                      Flexible(
                        child: ButtonWidget (
                          text: "Edit", 
                          onPressed: () {
                              //controller.update();
                          },
                        ),
                      ),
                      Flexible(
                        child: ButtonWidget (
                          text: "Delete", 
                          onPressed: () {
                              //controller.delete();
                          },
                        ),
                      )
                    ]
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}