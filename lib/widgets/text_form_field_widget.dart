import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool? isObscure;
  final Widget? suffixIcon;
  final Color enableBorderColor;
  final Color fucosedBorderSideColor;
  final int? maxLength;
  final bool enabled;
  final TextInputType keyboardtype;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSaved;
  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.isObscure,
    this.suffixIcon,
    this.maxLength,
    required this.enabled,
    required this.enableBorderColor,
    required this.fucosedBorderSideColor,
    required this.keyboardtype,
    required this.controller,
    this.validator,
    this.onPressed,
    this.onChange,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: Colors.black),
          enabled: enabled,
          obscureText: isObscure ?? false,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w200,
                fontSize: 12,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: fucosedBorderSideColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: enableBorderColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            suffixIcon: suffixIcon,
          ),
          maxLength: maxLength,
          keyboardType: keyboardtype,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChange,
          onSaved: onSaved,
        ),
      ],
    );
  }
}