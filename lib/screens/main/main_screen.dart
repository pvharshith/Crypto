import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/screens/home/components/crypto_widget.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/main/components/side_menu.dart';
import '../../constants.dart';
import 'components/header.dart';

class MainScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(
                child: HomeScreen(),
              ),
            ),
            SizedBox(
              height: 1707,
              //width: 100,

              child: Homepage(),
            ),
          ],
        ),
      ),
    );
  }
}
