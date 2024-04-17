import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/mobileappwrapper/mobile_app_wrapper.dart';
import 'package:markprintgeo/view/screens/surveys/start_survey_screen.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  void _route() async {
    await Get.find<SurveyController>().inistializeSurvey(context);
  }

  void initState() {
    super.initState();
    _route();
  }

  @override
  Widget build(BuildContext context) {
    return MobileAppWraper(
      search: true,
      notes: true,
      child: GetBuilder<SurveyController>(builder: (surveyController) {
        return Scaffold(
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
                height: Get.height,
                child: Column(
                  children: ["Contact Form"].map((survey) {
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
                        width: Get.width,
                        height: Get.height * 0.25,
                        duration: Duration(microseconds: 500),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(Images.writing),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.5),
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
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(Dimensions.paddingSizeSmall),
                              height: 70,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    Dimensions.radiusDefault,
                                  ),
                                  bottomRight: Radius.circular(
                                    Dimensions.radiusDefault,
                                  ),
                                ),
                                color: Colors.black.withOpacity(0.3),
                                border: Border.all(
                                  width: 0.25,
                                  color: Theme.of(context)
                                      .dividerColor
                                      .withOpacity(0.1),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact Form",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                  ),
                                  Text(
                                    "1 response - Modified: Today 02:09 PM",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withOpacity(0.75),
                                        ),
                                  ),
                                ],
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
      }),
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
