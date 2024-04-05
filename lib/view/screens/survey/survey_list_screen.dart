import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/surveys/start_survey_screen.dart';


class SurveyListScreen extends StatefulWidget {
  final String? categories;
  const SurveyListScreen({super.key,this.categories});

  @override
  State<SurveyListScreen> createState() => _SurveyListScreenState();
}

class _SurveyListScreenState extends State<SurveyListScreen> {
  final List<String> items = List<String>.generate(100, (i) => "Item $i");

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
                Icons.refresh,
                color: AppConstants.color2,
                size: 16,
              ),
              onPressed: () {
                surveyController.inistializeSurvey(context);
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
              child: !surveyController.isLoading
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: Get.height,
                            child: Column(
                              children: surveyController.survey.map((survey) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StartSurveyScreen(),
                                      ),
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(microseconds: 500),
                                    padding: EdgeInsets.all(
                                        Dimensions.paddingSizeExtraSmall),
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            Dimensions.paddingSizeExtraSmall),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusDefault),
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 0.25,
                                        color: Theme.of(context)
                                            .dividerColor
                                            .withOpacity(0.1),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          padding: EdgeInsets.all(
                                              Dimensions.paddingSizeSmall),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  Dimensions.radiusDefault),
                                              topRight: Radius.circular(
                                                  Dimensions.radiusDefault),
                                            ),
                                            color: Color(
                                                    (Random().nextDouble() *
                                                            0xFFFFFF)
                                                        .toInt())
                                                .withOpacity(1.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: Dimensions
                                                      .paddingSizeExtraSmall,
                                                  horizontal: Dimensions
                                                      .paddingSizeDefault,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimensions.radiusLarge,
                                                  ),
                                                  color: Theme.of(context)
                                                      .hintColor
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.paddingSizeDefault,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(
                                                Dimensions.paddingSizeSmall),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      survey.title.toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppConstants
                                                                .color5,
                                                          ),
                                                    ),
                                                    Text(
                                                      "Questions",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Dimensions
                                                      .paddingSizeSmall,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 0,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal),
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                          ),
                                                          shadowColor:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                        onPressed: () async {},
                                                        child: Text(
                                                          "Start Survey",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .labelSmall
                                                              ?.copyWith(
                                                                  color: AppConstants
                                                                      .color2),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Icon(
                                                          Icons.graphic_eq,
                                                          size: 18,
                                                          color: AppConstants
                                                              .color5
                                                              .withOpacity(0.5),
                                                        ),
                                                        SizedBox(
                                                          width: Dimensions
                                                              .paddingSizeSmall,
                                                        ),
                                                        Icon(
                                                          Icons.share,
                                                          size: 18,
                                                          color: AppConstants
                                                              .color5
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
                          )
                        
                        
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
        ),
      );
    });
  }
}
