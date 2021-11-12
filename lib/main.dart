import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_theory_matching_game/style/style.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Matching Game',
      initialRoute: AppRoutes.homePage,
      getPages: RoutePages.pages,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(primarySwatch: themeColor),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
