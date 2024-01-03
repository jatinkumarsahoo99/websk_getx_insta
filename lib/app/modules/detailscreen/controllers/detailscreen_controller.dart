import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../../ApiService/ConnectorController.dart';
import '../../../provider/Utils.dart';

class DetailscreenController extends GetxController {
  //TODO: Implement DetailscreenController

  final count = 0.obs;
  Map<String, dynamic> data = {};
  Rx<bool> isLike = Rx<bool>(false);
  saveNetworkImage({String? url}) async {
    Utils.showLoading3();
    Get.find<ConnectorController>().GETMETHODCALL1(
      api: url ??
          "https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg",
      fun: (data) async {
        closeDialogIfOpen();
        if (data is Uint8List) {
          final result = await ImageGallerySaver.saveImage(
              Uint8List.fromList(data),
              quality: 60,
              name: "hello");
          print(">>>>result"+result.toString());
          if(result['isSuccess'] == true){
            Get.snackbar("Download", "Downloaded successfully",duration: Duration(seconds: 3),
                snackPosition:SnackPosition.BOTTOM );
          }else{
            Get.snackbar("Download", "Download failed!!",duration: Duration(seconds: 3), snackPosition:SnackPosition.BOTTOM );
          }
        }else{
          // closeDialogIfOpen();
          Get.snackbar("Download", "Download failed!!",duration: Duration(seconds: 3), snackPosition:SnackPosition.BOTTOM );
        }
      },
    );

    /*var response = await Dio().get(
        url ??
            "https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);*/
    // Utils.toast("$result");
  }
  closeDialogIfOpen() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
  @override
  void onInit() {
    data = Get.arguments;
    print("data>>>>>" + data.toString());
    super.onInit();
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
