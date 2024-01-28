import 'package:dart_camera/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends BaseWidget {
  
  const FloatingActionButtonWidget( {
    super.key,
    required this.centerBottomIcon,
    required this.bottomTrailIcon,
    required this.onPressedCenterBottomIcon,
    required this.onPressedBottomTrailIcon,
  } );

  final Icon centerBottomIcon, bottomTrailIcon;
  final VoidCallback? onPressedCenterBottomIcon, onPressedBottomTrailIcon;
  
  @override
  Widget build(BuildContext context) {
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