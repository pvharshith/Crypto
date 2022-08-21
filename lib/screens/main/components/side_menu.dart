import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';

import '../../../constants.dart';

class SideMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkBlackColor,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5, vertical: 20),
                  child: Text(
                    'Crypto.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  press: () {
                    _controller.setMenuIndex(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: isActive,
        selectedTileColor: kPrimaryColor,
        onTap: press,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Raleway",
          ),
        ),
      ),
    );
  }
}
