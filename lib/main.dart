import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/ApiService/BinderData.dart';
import 'app/routes/app_pages.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Change as needed
    statusBarBrightness: Brightness.dark, // Change as needed
    systemNavigationBarColor: Colors.transparent, // Change as needed
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // Change as needed
  ));

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BinderData(),
    ),
  );
}

