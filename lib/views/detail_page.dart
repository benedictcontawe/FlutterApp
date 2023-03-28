import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_http/controllers/detail_controller.dart';
import 'package:dart_http/views/base_view.dart';
import 'package:dart_http/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends BaseView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("DetailPage build");
    debugPrint("DetailPage initialized ${controller.initialized}");
    debugPrint("DetailPage isClosed ${controller.isClosed}");

    return Scaffold( 
      appBar: AppBarWidget(height: MediaQuery.of(context).size.height * 0.10, title: "Details",),
      body: Obx( () {
        if (controller.isLoading()) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage (
                imageUrl: controller.getImage(),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
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
              Text(
                "${controller.getTitle()}", 
                maxLines: 1, 
                overflow: TextOverflow.visible, 
                style: const TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.bold), 
                textAlign: TextAlign.center,
              ),
              Text(
                "${controller.getExplanation()}", 
                maxLines: 3, 
                overflow: TextOverflow.visible, 
                style: const TextStyle(color: Colors.blueAccent, fontSize: 13,), textAlign: TextAlign.justify,
              ),
              Text(
                "${controller.getDate()}", 
                maxLines: 1, 
                overflow: TextOverflow.visible, 
                style: const TextStyle(color: Colors.orangeAccent, fontSize: 10, fontWeight: FontWeight.normal, ),
              ),
              Text(
                "${controller.getCopyright()}", 
                maxLines: 1, 
                overflow: TextOverflow.visible, 
                style: const TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.normal,),
              ),
            ],
          );
        }
      }, ),
    );
  }
}