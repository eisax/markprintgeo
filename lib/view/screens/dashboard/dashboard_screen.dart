import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/surveys/start_survey_screen.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_progressbar_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  void _route() async {
    await Get.find<SurveyController>().inistializeSurvey(context);
  }

  void initState() {
    super.initState();
    _route();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leadingWidth: 130,
          leading: Center(
            child: Text(
              "markprintgeo",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          actions: [
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.brown,
              child: Text(
                "K",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              width: Dimensions.paddingSizeDefault,
            ),
          ],
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
              height: Get.height,
              child: Column(
                children: ["Hi"].map((survey) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartSurveyScreen(),
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(microseconds: 500),
                      padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        color: Colors.white,
                        border: Border.all(
                          width: 0.25,
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                        
                          SizedBox(
                            width: Dimensions.paddingSizeDefault,
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  EdgeInsets.all(Dimensions.paddingSizeSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "survey title",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppConstants.color5,
                                            ),
                                      ),
                                      Text(
                                        "Description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.paddingSizeSmall,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.normal),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            shadowColor:
                                                Theme.of(context).primaryColor,
                                          ),
                                          onPressed: () async {},
                                          child: Text(
                                            "Start Survey",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(
                                                    color: AppConstants.color2),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.graphic_eq,
                                            size: 18,
                                            color: AppConstants.color5
                                                .withOpacity(0.5),
                                          ),
                                          SizedBox(
                                            width: Dimensions.paddingSizeSmall,
                                          ),
                                          Icon(
                                            Icons.share,
                                            size: 18,
                                            color: AppConstants.color5
                                                .withOpacity(0.5),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget surveyCategoryWidget(
      BuildContext context, String name, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeExtraSmall,
      ),
      width: Get.width * 0.42,
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        border: Border.all(
          width: 0.2,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              color: Color(
                (Random().nextDouble() * 0xFFFFFF).toInt(),
              ).withOpacity(1.0),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSizeDefault,
          ),
          Expanded(
            child: Text(name,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    );
  }
}
