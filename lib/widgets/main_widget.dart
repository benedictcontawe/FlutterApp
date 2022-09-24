import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Column (
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopMe",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx( () {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return Center(child: CircularProgressIndicator()); /*StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: controller.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(controller.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ); */
              },
            ),
          ),
        ],
      );
  }
}