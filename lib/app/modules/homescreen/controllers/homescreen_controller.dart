import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ApiService/ConnectorController.dart';
import '../UserDataList.dart';

class HomescreenController extends GetxController {
  //TODO: Implement HomescreenController

  final count = 0.obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
  UserDataList ?userDataList;
  var pageController = PageController(initialPage: 0);
  var currentShowIndex = 0;
  fetchData(){
    Get.find<ConnectorController>().GETMETHODCALL1(
        api: "https://api.unsplash.com/photos/?client_id=8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas",
        fun: (map) {
          // Get.back();
          print(">>>>>>>>>>mapSta" + map.toString());
          if(map is List && map.length >0){
            userDataList = UserDataList.fromJson(map);
            log(">>>>jsonData"+(userDataList?.toJson()).toString());
          }
        });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
