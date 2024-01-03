import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ApiService/ConnectorController.dart';
import '../UserDataList.dart';

class HomescreenController extends GetxController {
  //TODO: Implement HomescreenController

  final count = 0.obs;
  late Timer sliderTimer;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
  UserDataList ?userDataList;
  // var pageController = PageController(initialPage: 0);
  var currentShowIndex = 0;
  List<PageController> pageConList = [];
  fetchData(){
    Get.find<ConnectorController>().GETMETHODCALL(
        api: "https://api.unsplash.com/photos/?client_id=8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas",
        fun: (map) {
          // Get.back();
          print(">>>>>>>>>>mapSta" + map.toString());
          if(map is List && map.length >0){
            userDataList = UserDataList.fromJson(map);
            log(">>>>jsonData"+(userDataList?.toJson()).toString());
            pageConList = List.generate((userDataList?.bodyData?.length??0), (index) => PageController(initialPage: 0)) ;
            update(['all']);
            // callFun();
          }
        });
  }

  @override
  void onReady() {

    super.onReady();
  }

  callFun(){
    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      for (var element in pageConList) {
        if (currentShowIndex == 0) {
          element.animateTo(Get.size.width,
              duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        } else if (currentShowIndex == 1) {
          element.animateTo(Get.size.width * 2,
              duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        } else if (currentShowIndex == 2) {
          element.animateTo(0,
              duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        }
      }

    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
