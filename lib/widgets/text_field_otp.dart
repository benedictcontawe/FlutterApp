import 'package:get_x/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class TextFieldOTP extends BaseWidget {

  const TextFieldOTP({Key? key, required TextEditingController this.textEditingController, required bool this.first, required bool this.last,}) : super(key: key);

  final TextEditingController textEditingController;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: textEditingController,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF13235A)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}