
import 'package:flutter/material.dart';
import 'package:getx_storage/views/base_view.dart';
import 'package:getx_storage/widgets/app_bar_widget.dart';

class ObjectPage extends BaseView {
  
  const ObjectPage( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Scaffold ( 
      appBar: const AppBarWidget(),
      body: throw UnimplementedError(),
    );
  }
}