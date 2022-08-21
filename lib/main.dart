// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/models/crypto_provider.dart';
import 'package:news/screens/main/main_screen.dart';
import 'package:news/servies/authentication.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        )
      ],
      child: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Authentication())],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kBgColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kBodyTextColor),
              bodyText2: TextStyle(color: kBodyTextColor),
              headline5: TextStyle(color: kDarkBlackColor),
            ),
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}
