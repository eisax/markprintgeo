import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/surveys/start_survey_screen.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_dropdown_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/multiple_selection_widget.dart';
import 'package:markprintgeo/view/widgets/selection_widget.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';
import 'package:shimmer/shimmer.dart';

class SurveyListScreen extends StatefulWidget {
  const SurveyListScreen({super.key});

  @override
  State<SurveyListScreen> createState() => _SurveyListScreenState();
}

class _SurveyListScreenState extends State<SurveyListScreen> {
  String selectedValue = '';
  final List<String> items = List<String>.generate(100, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstants.color2,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ), // Leading icon
        title: Center(
          child: Text(
            "Collect Electronic Data",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppConstants.color2),
          ),
        ), // Title
        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
              color: AppConstants.color2,
              size: 16,
            ),
            onPressed: () {
              // Add your search functionality here
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSizeDefault,
            left: Dimensions.paddingSizeDefault,
            right: Dimensions.paddingSizeDefault,
          ),
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.defaultSpacing,
                ),
                Container(
                  height: Get.height,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Dimensions.paddingSizeSmall,
                      mainAxisSpacing: Dimensions.defaultSpacing,
                    ),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
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
                          padding: EdgeInsets.only(
                              bottom: Dimensions.paddingSizeSmall),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusDefault),
                              color: Colors.white,
                              border: Border.all(
                                  width: 0.25,
                                  color: Theme.of(context)
                                      .dividerColor
                                      .withOpacity(0.1))),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeSmall),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Dimensions.radiusDefault),
                                        topRight: Radius.circular(
                                          Dimensions.radiusDefault,
                                        ),
                                      ),
                                      color: Color((Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                          .withOpacity(1.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Dimensions
                                              .paddingSizeExtraSmall,
                                          horizontal:
                                              Dimensions.paddingSizeDefault,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                              Dimensions.radiusLarge,
                                            ),
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.5)),
                                        child: Text(
                                          "Active",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppConstants.color2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.paddingSizeSmall),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "10",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppConstants
                                                          .color5),
                                            ),
                                            Text(
                                              "Questions",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: AppConstants
                                                          .color5),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "192",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppConstants
                                                          .color5),
                                            ),
                                            Text(
                                              "Participants",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: AppConstants
                                                          .color5),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.paddingSizeSmall),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "2021.11.24",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  color: AppConstants.color5
                                                      .withOpacity(0.5)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.auto_graph,
                                              size: 16,
                                              color: AppConstants.color5
                                                  .withOpacity(0.5),
                                            ),
                                            Icon(
                                              Icons.edit,
                                              size: 16,
                                              color: AppConstants.color5
                                                  .withOpacity(0.5),
                                            ),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 16,
                                              color: AppConstants.color5
                                                  .withOpacity(0.5),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
