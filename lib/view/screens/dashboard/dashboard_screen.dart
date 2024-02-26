import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_progressbar_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int selectedCategory = 0;
  bool isBookMarked = false;
  final categoryTypes = ["All", "Recommended", "Remote jobs", "Local jobs"];
  final surveys = [
    "Welding",
    "Security",
    "Shop Keeping",
    "House Keeping",
    "Auto",
    "Electromics",
    "Fitter",
    "Petroleum"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(top: 50),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            //profile area
            Container(
              width: Get.width,
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today's Surveys",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor)),
                          Text("Upcoming surveys",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).hintColor)),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Images.notifications,
                    width: 24,
                    height: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.defaultSpacing,
            ),

            //category type area
            Container(
              width: Get.width,
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        surveyCategoryWidget(context, "Science", Icons.science),
                        surveyCategoryWidget(
                            context, "Social", Icons.social_distance),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        surveyCategoryWidget(
                            context, "Tech", Icons.table_chart_rounded),
                        surveyCategoryWidget(context, "Gaming", Icons.gamepad),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        surveyCategoryWidget(context, "History", Icons.history),
                        surveyCategoryWidget(
                            context, "Analytics", Icons.graphic_eq),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // job types title
            Container(
              width: Get.width,
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Surveys",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RouteHelper.surveyslist);
                    },
                    child: Text("See All",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                  )
                ],
              ),
            ),

            //job category list
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                child: ScrollConfiguration(
                  behavior: BouncingScrollBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: surveys
                          .asMap()
                          .entries
                          .map(
                            (entry) => Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeDefault),
                              width: Get.width,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/disease.jpg"),
                                                  fit: BoxFit.cover
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.paddingSizeSmall),
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                      ),
                                      SizedBox(
                                        width: Dimensions.defaultSpacing,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Disease",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  "18",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  Dimensions.paddingSizeSmall,
                                            ),
                                            CustomProgressBar(
                                              width: Get.width,
                                              height: 3,
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              deactivatedColor:
                                                  Theme.of(context)
                                                      .disabledColor,
                                              backgroundColor: Colors.white,
                                              value: 0.7,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
