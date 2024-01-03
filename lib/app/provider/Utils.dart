import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Utils{
  static showLoading3(){
    Get.dialog(
      WillPopScope(
          onWillPop: () async => true,
          child:
          SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          )
        /*  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.red,
            ),
          ],
        ),*/
      ),
      barrierDismissible: false,
    );
  }
  static showLoading4(){
    Get.dialog(
      WillPopScope(
          onWillPop: () async => true,
          child:
          Center(
            child: SizedBox(
              width: Get.width*0.6,
              height: Get.height*0.2,
              child: Column(
                children: [
                  SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                  const Text("Downloadeing......",style: TextStyle(fontSize: 15,color: Colors.black),)
                ],
              ),
            ),
          )
        /*  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.red,
            ),
          ],
        ),*/
      ),
      barrierDismissible: false,
    );
  }
}