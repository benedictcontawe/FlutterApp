import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends BaseWidget<MainController> {
  
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return ListView.builder (
        controller: controller.getScrollController(),
        itemCount: controller.getLength(),
        itemBuilder: (BuildContext context, int index) {
          return Card (
            child: InkWell (
              onTap: () {
                controller.launchDetails(index);
              },
              child: Column (
                children: [
                  ListTile(
                    leading: CachedNetworkImage (
                      imageUrl: controller.getImage(index),
                      fit: BoxFit.cover,
                      height: 200,
                      width: 50,
                      alignment: Alignment.center,
                      placeholder: (context, url) {
                        return const CircularProgressIndicator();
                      },
                      errorWidget: ( (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.cyan,
                          size: 30.0,
                        );
                      } ),
                    ),
                    dense: true,
                    title: Text("${controller.getTitle(index)}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                    subtitle: Text("${controller.getExplanation(index)}", maxLines: 2, overflow: TextOverflow.ellipsis,),
                    trailing: Column(
                      children: [
                        Text("${controller.getDate(index)}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Text("${controller.getCopyright(index)}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ]
                    ),
                  )
                ],
              ),
            )
          );
        }
      );
    }, );
  }
}