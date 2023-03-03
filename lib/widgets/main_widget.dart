import 'package:flutter/material.dart';
import 'package:page_view/controllers/main_controller.dart';
import 'package:page_view/widgets/base_widget.dart';
import 'package:page_view/widgets/page_view_widget.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Stack(
      children: <Widget> [
        PageViewWidget(),
        Positioned (
          left: 0,
          right: 0,
          bottom: 0,
          height: 40,
          child: Container (
            color: Colors.black12,
            child: null/*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _Pages.length,
                (index) => Padding (
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () {
                      _pageViewController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn
                      );
                    },
                    child: CircleAvatar(
                      radius: 5,
                      // check if a dot is connected to the current page
                      // if true, give it a different color
                      backgroundColor: _activePage == index ? Colors.greenAccent : Colors.white30,
                    ),
                  ),
                )
              ),
            ),
            */
          ),
        ),
      ],
    );
  }
}