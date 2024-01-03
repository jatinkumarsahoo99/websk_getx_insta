import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Widgets/instaProfile.dart';
import '../../../routes/app_pages.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends StatelessWidget {
  HomescreenView({Key? key}) : super(key: key);

  HomescreenController controllerX =
  Get.put<HomescreenController>(HomescreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<HomescreenController>(
          assignId: true,
          id: "all",
          builder: (controllerX) {
            return SafeArea(
              child: (controllerX.userDataList != null &&  (controllerX.userDataList?.bodyData?.length != null) &&
                  (controllerX.userDataList?.bodyData?.length??0) > 0) ?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Instagram", style: TextStyle(fontWeight: FontWeight
                            .bold, fontSize: 23,),),
                        Row(
                          children: [
                            Icon(Icons.favorite_border),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.message_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      // width: Get.width * 1,
                      child: ListView.builder(
                          itemCount: controllerX.userDataList?.bodyData?.length??0,
                          padding: EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(
                                  left: 2.0, right: 2, top: 2),
                              child: Column(
                                children: [
                                  /* Center(
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
                                    ),
                                    // Use a large value for a circular border
                                    border:
                                    Border.all(width: 2.0, color: Colors.white),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            100.0),
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
                              ),*/
                                  InstaProfile(width: 100,height: 100,
                                      url: controllerX.userDataList?.bodyData?[index].user?.profileImage?.large),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(controllerX.userDataList?.bodyData?[index].user?.username??"JKS")
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: GetBuilder<HomescreenController>(
                      assignId: true,
                      id: "lst2",
                      builder: (controllerX) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: ListView.builder(
                              itemCount:controllerX.userDataList?.bodyData?.length??0,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, bottom: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          InstaProfile(height: 50, width: 50,url:
                                          controllerX.userDataList?.bodyData?[index].user?.profileImage?.small),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(controllerX.userDataList?.bodyData?[index].user?.username??"Jatin Kumar Sahoo")
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.4,
                                        child: PageView(
                                          controller: controllerX
                                              .pageConList[index],
                                          pageSnapping: true,
                                          onPageChanged: (index) {
                                            controllerX.currentShowIndex =
                                                index;
                                            // controllerX.update(['lst2']);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.DETAILSCREEN,arguments: {"url":
                                                controllerX.userDataList?.bodyData?[index].user?.profileImage?.large,
                                                  "likes":(controllerX.userDataList?.bodyData?[index].likes??"0").toString(),
                                                  "bio":  controllerX.userDataList?.bodyData?[index].user?.bio??"",
                                                  "name": controllerX.userDataList?.bodyData?[index].user?.username,
                                                  "dow":  controllerX.userDataList?.bodyData?[index].urls?.small
                                                });
                                              },
                                              child: Container(
                                                height: Get.height * 0.3,
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(100.0),
                                                  // color: Colors.white,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      controllerX.userDataList?.bodyData?[index].user?.profileImage?.large??
                                                      'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                Get.toNamed(
                                                    Routes.DETAILSCREEN,arguments:{"url":
                                                controllerX.userDataList?.bodyData?[index].urls?.regular,
                                                  "likes":(controllerX.userDataList?.bodyData?[index].likes??"0").toString(),
                                                  "bio":  controllerX.userDataList?.bodyData?[index].user?.bio??"",
                                                  "name": controllerX.userDataList?.bodyData?[index].user?.username,
                                                  "dow":  controllerX.userDataList?.bodyData?[index].links?.download
                                                } );
                                              },
                                              child: Container(
                                                height: Get.height * 0.3,
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(100.0),
                                                  // color: Colors.white,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      controllerX.userDataList?.bodyData?[index].urls?.full??
                                                      'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SmoothPageIndicator(
                                        controller: controllerX
                                            .pageConList[index],
                                        // PageController
                                        count: 2,
                                        effect: WormEffect(
                                            activeDotColor: Theme
                                                .of(context)
                                                .primaryColor,
                                            dotColor: Theme
                                                .of(context)
                                                .dividerColor,
                                            dotHeight: 10.0,
                                            dotWidth: 10.0,
                                            spacing: 5.0),
                                        // your preferred effect
                                        onDotClicked: (index) {},
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                  )
                ],
              ) : Container(),
            );
          },
        ));
  }
}
