import 'package:dart_camera/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionButtonWidget extends BaseWidget {
  
  const FloatingActionButtonWidget( {
    super.key,
    this.isCenterBottomIconPressed,
    required this.centerBottomIcon,
    required this.bottomTrailIcon,
    this.centerBottomIconPressed,
    required this.onPressedCenterBottomIcon,
    required this.onPressedBottomTrailIcon,
  } );

  final RxBool? isCenterBottomIconPressed;
  final Icon centerBottomIcon, bottomTrailIcon;
  final Icon? centerBottomIconPressed;
  final VoidCallback? onPressedCenterBottomIcon, onPressedBottomTrailIcon;
  
  @override
  Widget build(BuildContext context) {
    if (isCenterBottomIconPressed != null) {
      return _buildReactiveWidget(context);
    } else {
      return _buildWidget(context);
    }
  }

  Widget _buildReactiveWidget(BuildContext context) {
    return Obx(() {
      if (isCenterBottomIconPressed != null && isCenterBottomIconPressed == true) {
        return Stack (
          children: [
            Positioned (
              bottom: 16.0,
              right: MediaQuery.of(context).size.width / 2 - 36.0,
              child: FloatingActionButton (
                onPressed: onPressedCenterBottomIcon,
                child: centerBottomIconPressed,
              ),
            ),
            Positioned (
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton (
                onPressed: onPressedBottomTrailIcon,
                child: bottomTrailIcon,
              ),
            ),
          ],
        );
      } else {
        return _buildWidget(context);
      }
    } );
  }

  Widget _buildWidget(BuildContext context) {
    return Stack (
      children: [
        Positioned (
          bottom: 16.0,
          right: MediaQuery.of(context).size.width / 2 - 36.0,
          child: FloatingActionButton (
            onPressed: onPressedCenterBottomIcon,
            child: centerBottomIcon,
          ),
        ),
        Positioned (
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton (
            onPressed: onPressedBottomTrailIcon,
            child: bottomTrailIcon,
          ),
        ),
      ],
    );
  }
}