// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/data/model/response/survey.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class AnswerInputTemplate extends StatefulWidget {
  final Question question;

  bool isrequired;
  // List<TextEditingController> answercontrollers;
  AnswerInputTemplate({
    super.key,
    // required this.answercontrollers,
    this.isrequired = false,
    required this.question,
  });

  @override
  State<AnswerInputTemplate> createState() => _AnswerInputTemplateState();
}

class _AnswerInputTemplateState extends State<AnswerInputTemplate> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        width: Get.width,
        decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          color: AppConstants.color2,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 0.25,
          ),
        ),
        child: Column(
          children: [
           
            
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text(
                    widget.question.question,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                          
                          fontSize: Dimensions.fontSizeExtraLarge,
                          fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomTextField(
                    controller: title,
                    hintText: "title",
                    fillColor: Colors.transparent,
                    onChanged: (value) {
                      setState(() {
                        if (surveyController.mysurvey.questions != null) {
                          for (int i = 0;
                              i < surveyController.mysurvey.questions!.length;
                              i++) {
                            if (surveyController.mysurvey.questions![i].id ==
                                widget.question.id) {
                              surveyController.mysurvey.questions?[i].question =
                                  value;
                              // surveyController.mysurvey.questions?[i].answers
                              //     .add(value);
                              break;
                            }
                          }
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text(
                    widget.question.description,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                  ),
                  
                  
                  (widget.question.questionType == 'multiple_choice' ||
                          widget.question.questionType ==
                              'multiple_choice_grid' ||
                          widget.question.questionType == 'dropdown')
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimensions.paddingSizeSmall,
                            ),

                            // Column(
                            //   children: widget.question.answers
                            //       .asMap()
                            //       .entries
                            //       .map((answer) {
                            //     widget.question.answers.forEach((_) {
                            //       widget.answercontrollers.add(
                            //         TextEditingController(),
                            //       );
                            //     });

                            //     return SizedBox(
                            //       width: Get.width,
                            //       child: Column(
                            //         children: [
                            //           SizedBox(
                            //             height: Dimensions.paddingSizeDefault,
                            //           ),
                            //           Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Icon(
                            //                 Icons.grain_rounded,
                            //                 color: Theme.of(context).hintColor,
                            //                 size: 16,
                            //               ),
                            //               SizedBox(
                            //                 width: Dimensions
                            //                     .paddingSizeExtraSmall,
                            //               ),
                            //               Expanded(
                            //                 child: CustomTextField(
                            //                   controller:
                            //                       widget.answercontrollers[
                            //                           answer.key],
                            //                   hintText: answer.value,
                            //                   fillColor: Colors.transparent,
                            //                   onChanged: (String value) {
                            //                     //  answercontrollers[answer.key] = value;
                            //                     // questions[question.id].answers.add(
                            //                     //     answercontrollers[answer.key]
                            //                     //         .text);
                            //                   },
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 width: Dimensions.paddingSizeSmall,
                            //               ),
                            //               AnimatedContainer(
                            //                 duration:
                            //                     Duration(milliseconds: 200),
                            //                 child: GestureDetector(
                            //                   onTap: () {
                            //                     // _deleteAnswer(
                            //                     //     questionid: question.id,
                            //                     //     answerid: answer.key);
                            //                   },
                            //                   child: Icon(
                            //                     Icons.delete,
                            //                     color:
                            //                         Theme.of(context).hintColor,
                            //                     size: 16,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),
                            // SizedBox(
                            //   height: Dimensions.paddingSizeSmall,
                            // ),
                            GestureDetector(
                              onTap: () {
                                // _addAnswer(
                                //     questionid: question.id,
                                //     answer: "Add answer");
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: AppConstants.color10,
                                    size: 16,
                                  ),
                                  Text(
                                    "Add answer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: AppConstants.color10,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      );
    });
  }


}
