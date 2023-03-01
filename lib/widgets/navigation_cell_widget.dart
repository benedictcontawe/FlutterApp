import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class NavigationCellWidget extends MouseRegion {

  static final appContainer = html.window.document.querySelectorAll('flt-glass-pane')[0];

  NavigationCellWidget( {
    super.key,
    required Widget child,
    Function? onHover,
    Function? onExit
  } ) : super (
        
    onHover: (PointerHoverEvent evt) {
      appContainer.style.cursor = 'pointer';
      if (onHover != null)  onHover();
    },
  
    onExit: (PointerExitEvent evt) {
      appContainer.style.cursor = 'default';
      if (onExit != null)  onExit();
    },
  
    child: child,
  );
}