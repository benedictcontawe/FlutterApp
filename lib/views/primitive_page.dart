
import 'package:flutter/material.dart';
import 'package:getx_storage/views/base_view.dart';
import 'package:getx_storage/widgets/app_bar_widget.dart';
import 'package:getx_storage/widgets/primitive_widget.dart';

class PrimitivePage extends BaseView {
  
  const PrimitivePage( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return const Scaffold ( 
      appBar: AppBarWidget(),
      body: PrimitiveWidget(),
    );
  }
}