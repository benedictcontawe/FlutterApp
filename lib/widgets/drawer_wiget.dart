import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/drawer_header_widget.dart';
import 'package:dart_media_query/widgets/drawert_cell_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends BaseWidget {

  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeaderWidget(),
          const DrawerCellWidget(icon: Icons.contacts,text: 'Contacts',),
          const DrawerCellWidget(icon: Icons.event, text: 'Events',),
          const DrawerCellWidget(icon: Icons.note, text: 'Notes',),
          const Divider(),
          const DrawerCellWidget(icon: Icons.collections_bookmark, text: 'Steps'),
          const DrawerCellWidget(icon: Icons.face, text: 'Authors'),
          const DrawerCellWidget(icon: Icons.account_box, text: 'Flutter Documentation'),
          const DrawerCellWidget(icon: Icons.stars, text: 'Useful Links'),
          const Divider(),
          const DrawerCellWidget(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: const Text('0.0.1'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}