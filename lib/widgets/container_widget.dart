import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  
  const ContainerWidget( { 
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return new Container (
              child: Center( child: Text("Page 3")) ,
              color: Colors.white,
    );
  }
}