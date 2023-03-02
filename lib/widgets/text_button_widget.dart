import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class TextButtonWidget extends BaseWidget {
  
  const TextButtonWidget( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        //primary: Colors.purpleAccent,
        side: BorderSide(color: Colors.red, width: 5),
      ),
      child: const Text(
        'Text Button ',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

}