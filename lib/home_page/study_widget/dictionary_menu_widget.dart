import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../custom/colors/custom_design_colors.dart';

class DictionaryMenuWidget extends StatelessWidget {
  const DictionaryMenuWidget({
    super.key,
    required this.selectedMenu,
  });

  final String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'menu_3',
          child: ListTile(
            trailing: Icon(Icons.switch_left_rounded),
            // leading: Icon(Icons.),
            title: Text('EN-RU TOP-1000'),
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'menu_3',
          child: ListTile(
            trailing: Icon(Icons.switch_left_rounded),
            // leading: Icon(Icons.),
            title: Text('DE-RU TOP-1000'),
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          ),
        ),
        PopupMenuItem<String>(
          key: const ValueKey(0),
          value: 'menu_3',
          child: ClipRRect(
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {},
                    backgroundColor: Colors.white,
                    // foregroundColor: Colors.white,
                    foregroundColor: Colors.grey,
                    icon: Icons.edit_rounded,
                    // label: 'Edit',
                    borderRadius: BorderRadius.circular(100),
                    spacing: 0,
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction(
                    onPressed: (BuildContext context) {},
                    backgroundColor: Colors.white,
                    // foregroundColor: Colors.red,
                    // foregroundColor: Colors.grey,
                    foregroundColor: Colors.red[200],
                    icon: FontAwesomeIcons.trashCan,
                    // label: 'Edit',
                    borderRadius: BorderRadius.circular(100),
                    spacing: 0,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              child: const ListTile(
                trailing: Icon(Icons.switch_left_rounded),
                // leading: Icon(Icons.),
                title: Text('FR-RU TOP-1000'),
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              ),
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'create_dictionary',
          // padding: EdgeInsets.zero,
          child: ListTile(
            leading: const Icon(Icons.add),
            title: Text('create_dictionary'.tr),
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          ),
        ),
      ],
      elevation: 0,
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      color: CustomDesignColors.menuBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
