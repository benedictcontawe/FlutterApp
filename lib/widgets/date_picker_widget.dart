import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/widgets/base_widgets.dart';

class DatePickerWidget extends BaseWidget {
  
  const DatePickerWidget( {
    super.key,
    this.labelText,
    this.hintText,
    required this.dateController,
  } );

  final String? labelText;
  final String? hintText;
  final Rx<TextEditingController?> dateController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
      TextField (
        controller: dateController.value,
        decoration: InputDecoration (
          //icon: Icon( Icons.calendar_today ),
          hintText: hintText,
          labelText: labelText,
          /*
          border: const OutlineInputBorder (
            borderSide: BorderSide( color: Colors.blue, width: 1 ) 
          ),
          focusedBorder: const OutlineInputBorder( borderSide: BorderSide( color: Colors.blue, width: 1 ) ),
          enabledBorder: const OutlineInputBorder( borderSide: BorderSide( color: Colors.blue, width: 1 ) ),
          */
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker (
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),//DateTime(2000)not to allow to choose before today.
            lastDate: DateTime.now().add( const Duration(days: 365) )
          );
          if (pickedDate != null) {            
            dateController(TextEditingController( text: "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}"));
          }
        },
      )
    );
  }
}