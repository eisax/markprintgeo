import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/widgets/question_form_widget.dart';
import 'package:markprintgeo/view/screens/createsurvey/widgets/question_input_form_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/dialog_helper.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class CreateSurveyScreen extends StatefulWidget {
  const CreateSurveyScreen({super.key});

  @override
  State<CreateSurveyScreen> createState() => _CreateSurveyScreenState();
}

class _CreateSurveyScreenState extends State<CreateSurveyScreen> {
  int? id;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  List<TextEditingController> answercontrollers = [];

  @override
  void initState() {
    super.initState();
    createEmptySurvey();
  }

  void createEmptySurvey() async {
    await Get.find<SurveyController>().emptySurvey();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: BouncingScrollBehavior(),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.paddingSizeExtraLarge),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeSmall),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Dimensions.paddingSizeExtraLarge,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.paddingSizeExtraSmall),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Dimensions.paddingSizeSmall,
                                      ),
                                      CustomTextField(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                              textBaseline: null,
                                            ),
                                        controller: title,
                                        hintText: "title",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.5)),
                                        borderColor: Colors.white,
                                        fillColor: Colors.transparent,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              surveyController.mysurvey.title =
                                                  newValue;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.paddingSizeExtraSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.paddingSizeExtraSmall),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Dimensions.paddingSizeSmall,
                                      ),
                                      CustomTextField(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                              textBaseline: null,
                                            ),
                                        controller: description,
                                        hintText: "description",
                                        fillColor: Colors.transparent,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.white),
                                        borderColor: Colors.white,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              surveyController.mysurvey
                                                  .description = newValue;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.paddingSizeDefault,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        if (surveyController.mysurvey.questions != null)
                          Padding(
                            padding:
                                EdgeInsets.all(Dimensions.paddingSizeSmall),
                            child: Column(
                                children: surveyController.mysurvey.questions!
                                    .asMap()
                                    .entries
                                    .map((question) {
                              return GestureDetector(
                                onTap: () {
                                  DialogHelper.showGeneralDialog(
                                    context,
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          QuestionFormInputTemplate(
                                            question: question.value,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: QuestionInputTemplate(
                                  question: question.value,
                                ),
                              );
                            }).toList()),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomSheet: Container(
        //   width: Get.width,
        //   padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Expanded(
        //         child: SizedBox(
        //           height: 40,
        //           child: ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               elevation: 0,
        //               backgroundColor: Theme.of(context).primaryColor,
        //               textStyle: const TextStyle(
        //                   color: Colors.white, fontStyle: FontStyle.normal),
        //               shape: const RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(5),
        //                 ),
        //               ),
        //               shadowColor: Theme.of(context).primaryColor,
        //             ),
        //             onPressed: () async {
        //               // Navigator.push(
        //               //   context,
        //               //   MaterialPageRoute(
        //               //     builder: (context) => AddSurveyQuestionScreen(
        //               //       survey: Survey(
        //               //         id: 1,
        //               //         title: title.text,
        //               //         isWelcomeScreen: isWelcomeScreen,
        //               //         welcomeMessage: welcomeMessage.text,
        //               //         welcomedescription: welcomedescription.text,
        //               //         buttontext: buttontext.text,
        //               //         isDoneScreen: isDoneScreen,
        //               //         doneMessage: doneMessage.text,
        //               //         donedescription: donedescription.text,
        //               //       ),
        //               //     ),
        //               //   ),
        //               // );
        //             },
        //             child: Text(
        //               "Proceed Create Survey",
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .labelSmall
        //                   ?.copyWith(color: AppConstants.color2),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      );
    });
  }
}
