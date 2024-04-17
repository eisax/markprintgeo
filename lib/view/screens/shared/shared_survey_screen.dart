import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/mobileappwrapper/mobile_app_wrapper.dart';

class SharedSurveys extends StatefulWidget {
  const SharedSurveys({super.key});

  @override
  State<SharedSurveys> createState() => _SharedSurveysState();
}

class _SharedSurveysState extends State<SharedSurveys> {
  @override
  Widget build(BuildContext context) {
    return MobileAppWraper(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: Expanded(
              child: SizedBox(
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.white,
                        dividerColor: Colors.white.withOpacity(0.25),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white.withOpacity(0.5),
                        tabs: <Widget>[
                          Tab(
                            child: Center(
                              child: Text(
                                "FORMS",
                                style: TextStyle(
                                  fontSize: Dimensions.fontSizeSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Center(
                              child: Text(
                                "QUIZZES",
                                style: TextStyle(
                                  fontSize: Dimensions.fontSizeSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSizeDefault),
                                color: Colors.white,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Images.notepad,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeLarge,
                                    ),
                                    Text(
                                      "No Shared Forms Available",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSizeDefault),
                                color: Colors.white,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Images.notepad,
                                      width: 100,
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeLarge,
                                    ),
                                    Text(
                                      "No Shared Quiz Available",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
