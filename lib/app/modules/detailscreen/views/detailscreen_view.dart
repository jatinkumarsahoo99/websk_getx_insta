import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:gallery_saver/gallery_saver.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Widgets/instaProfile.dart';
import '../controllers/detailscreen_controller.dart';

class DetailscreenView extends GetView<DetailscreenController> {
  DetailscreenView({Key? key}) : super(key: key);

  DetailscreenController controllerX =
  Get.put<DetailscreenController>(DetailscreenController());

/*   saveNetworkImage() async {
     var response = await Dio().get(
         controllerX.data['url']?? "https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg",
         options: Options(responseType: ResponseType.bytes));
     final result = await ImageGallerySaver.saveImage(
         Uint8List.fromList(response.data),
         quality: 60,
         name: "hello");
     print(result);
     // Utils.toast("$result");
   }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InstaProfile(height: 50, width: 50, url:
                  controllerX.data['url'] ??
                      "https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controllerX.data['name'] ?? "Jatin Kumar Sahoo")
                ],
              ),
              SizedBox(height: 6),
              Container(
                height: Get.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      controllerX.data['url'] ??
                          'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return  InkWell(
                          onTap: (){
                            if(controllerX.isLike.value == false){
                              controllerX.isLike.value = true;
                              controllerX.isLike.refresh();
                            }else{
                              controllerX.isLike.value = false;
                              controllerX.isLike.refresh();
                            }

                          },
                          child: Container(
                              child:(controllerX.isLike.value)? Icon(Icons.favorite,color: Colors.red,):
                              Icon(Icons.favorite_border)),
                        );
                      }),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.message_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: (){
                            Share.share('Here is the url ${controllerX.data['url']}');
                          },
                          child: Icon(Icons.send_outlined)),
                    ],
                  ),
                  Icon(Icons.bookmark_outline_outlined),
                ],
              ),
              Row(
                children: [
                  Text("${controllerX.data['likes'] ?? "0"} likes",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 6),
              Text(controllerX.data['bio'] ??
                  "Located in the northwest of Saudi Arabia, NEOM’s diverse climate offers both sun-soaked beaches and snow-capped mountains. NEOM’s unique location will provide residents with enhanced livability while protecting 95% of the natural landscape.")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // FileDownloader.downloadFile(url: "https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg",);
        controllerX.saveNetworkImage(url: controllerX.data['url']);
        // GallerySaver.saveImage("https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg");
      },


          child: Icon(Icons.download)),
    );
  }
}
