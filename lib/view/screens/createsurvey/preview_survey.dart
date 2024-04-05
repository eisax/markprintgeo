import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/widgets/answer_form_widget.dart';

class PreviewSurvey extends StatefulWidget {
  const PreviewSurvey({super.key});

  @override
  State<PreviewSurvey> createState() => _PreviewSurveyState();
}

class _PreviewSurveyState extends State<PreviewSurvey> {
  int step = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return SafeArea(
          child: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            if (step == 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surveyController.mysurvey.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault),
                    child: Text(
                      surveyController.mysurvey.description ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        textStyle: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.normal),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(Dimensions.radiusSmall))),
                        shadowColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        setState(() {
                          step = 1;
                        });
                      },
                      child: Text(
                        "START",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            if (step == 1)
              SizedBox(
                height: Get.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      surveyController.mysurvey.title ?? "",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: SingleChildScrollView(
                            child: Column(
                                children: surveyController.mysurvey.questions!
                                    .asMap()
                                    .entries
                                    .map((question) {
                              return AnswerInputTemplate(
                                // answercontrollers: answercontrollers,
                                question: question.value,
                              );
                            }).toList()),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeSmall,
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.black,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            step = 2;
                          });
                        },
                        child: Text(
                          "SUBMIT",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Answered",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            " 0 ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "out of ${surveyController.mysurvey.questions!.length}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (step == 2)
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(Dimensions.defaultSpacing),
                    padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    decoration: BoxDecoration(
                        color:
                            Theme.of(context).highlightColor.withOpacity(0.25),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusSmall)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(300),
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Submitted",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontSize: Dimensions.fontSizeOverLarge,
                                      fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                            Text(
                              surveyController.mysurvey.description ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeExtraLarge,
                            ),
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              Dimensions.radiusSmall))),
                                  shadowColor: Theme.of(context).primaryColor,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    step = 0;
                                  });
                                },
                                child: Text(
                                  "REFRESH",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ));
    });
  }
}
