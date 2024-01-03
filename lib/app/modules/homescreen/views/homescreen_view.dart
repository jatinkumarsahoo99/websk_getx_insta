import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  HomescreenView({Key? key}) : super(key: key);

  HomescreenController controllerX =
      Get.put<HomescreenController>(HomescreenController());
  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Change as needed
      statusBarBrightness: Brightness.dark, // Change as needed
      systemNavigationBarColor: Colors.blue, // Change as needed
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark, // Change as needed
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: Get.width * 1,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 2),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amberAccent,
                                    Colors.purpleAccent,
                                    Colors.purple
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ), // Use a large value for a circular border
                                border:
                                    Border.all(width: 2.0, color: Colors.white),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("JKS")
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 3.0,bottom: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height:Get.height*0.4,
                          child: PageView(
                            controller: controller.pageController,
                            pageSnapping: true,
                            onPageChanged: (index) {
                              controller.currentShowIndex = index;
                            },
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                height: Get.height*0.3,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(100.0),
                                  // color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height*0.3,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(100.0),
                                  // color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height*0.3,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(100.0),
                                  // color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: controller.pageController, // PageController
                          count: 3,
                          effect: WormEffect(
                              activeDotColor: Theme.of(context).primaryColor,
                              dotColor: Theme.of(context).dividerColor,
                              dotHeight: 10.0,
                              dotWidth: 10.0,
                              spacing: 5.0), // your preferred effect
                          onDotClicked: (index) {},
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
