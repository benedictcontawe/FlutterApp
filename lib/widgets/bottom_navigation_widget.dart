import 'package:get_x/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends BaseWidget {

  const BottomNavigationWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home_filled,
            size: 40,
            color: Colors.indigo.shade900,),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu_rounded,
            size: 40,
            color: Colors.indigo.shade900,),
          ),
        ],),
      );
  }
}