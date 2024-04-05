import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/data/model/response/survey.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class QuestionInputTemplate extends StatefulWidget {
  final Question question;

  bool isrequired;
  List<TextEditingController> answercontrollers;
  QuestionInputTemplate({
    super.key,
    required this.answercontrollers,
    this.isrequired = false,
    required this.question,
  });

  @override
  State<QuestionInputTemplate> createState() => _QuestionInputTemplateState();
}

class _QuestionInputTemplateState extends State<QuestionInputTemplate> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        width: Get.width,
        decoration: BoxDecoration(
          color: AppConstants.color2,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.1),
            width: 0.25,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.25, color: Theme.of(context).dividerColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: Dimensions.paddingSizeExtraSmall,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeExtraSmall),
                          height: 30,
                          child: Center(
                            child: DropdownButton<String>(
                              underline: Container(),
                              hint: Text(
                                "Select Item",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              value: widget.question.questionType,
                              icon: Container(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    for (int i = 0;
                                        i <
                                            surveyController
                                                .mysurvey.questions!.length;
                                        i++) {
                                      if (surveyController
                                              .mysurvey.questions![i].id ==
                                          widget.question.id) {
                                        surveyController.mysurvey.questions![i]
                                            .questionType = newValue;
                                        break;
                                      }
                                    }
                                  }
                                });
                              },
                              items: <String>[
                                'short_answer',
                                'email',
                                'long_answer',
                                'number',
                                'multiple_choice',
                                'multiple_choice_grid',
                                'checkboxes',
                                'checkboxe_grid',
                                'dropdown',
                                'linear_scale',
                                'star_rating',
                                'smile',
                                'date',
                                'time',
                                'file_upload',
                                'add_section'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.menu,
                                          size: 16,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        SizedBox(
                                          width:
                                              Dimensions.paddingSizeExtraSmall,
                                        ),
                                        Text(
                                          value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                color:
                                                    Theme.of(context).hintColor,
                                                fontWeight: FontWeight.w400,
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
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.isrequired = !widget.isrequired;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.isrequired
                                ? Theme.of(context).primaryColor
                                : AppConstants.color2,
                            border: Border.all(
                              width: 0.1,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: widget.isrequired
                              ? const Center(
                                  child: Icon(
                                    Icons.done,
                                    color: AppConstants.color2,
                                    size: 12,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        "Required",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).hintColor,
                            fontSize: 8,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSizeSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showConfirmationDialog(
                            context,
                            'Are you sure you want to delete this item?',
                            () => surveyController.deleteQuestion(
                                questionid: widget.question.id),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 16,
                              color: Theme.of(context).hintColor,
                            ),
                            SizedBox(
                              width: Dimensions.paddingSizeExtraSmall,
                            ),
                            Text(
                              "Delete",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text(
                    "Question title",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomTextField(
                    controller: title,
                    hintText: "title",
                    fillColor: Colors.transparent,
                    onChanged: ( value) {
                     
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
                    "Description",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomTextField(
                    controller: description,
                    hintText: "Description",
                    fillColor: Colors.transparent,
                    onChanged: (value) {
                     
                      if (surveyController.mysurvey.questions != null) {
                        for (int i = 0;
                            i < surveyController.mysurvey.questions!.length;
                            i++) {
                          if (surveyController.mysurvey.questions![i].id ==
                              widget.question.id) {
                            surveyController
                                .mysurvey.questions?[i].description = value;
                            // surveyController.mysurvey.questions?[i].answers
                            //     .add(value);
                            break;
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  (widget.question.questionType == 'short_answer' ||
                          widget.question.questionType == 'short_answer')
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Max Characters",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeSmall,
                            ),
                            CustomTextField(
                              inputType: TextInputType.phone,
                              controller: TextEditingController(),
                              hintText: "max characters",
                              fillColor: Colors.transparent,
                            ),
                          ],
                        )
                      : Container(),
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
                            Text(
                              "Answers",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Column(
                              children: widget.question.answers
                                  .asMap()
                                  .entries
                                  .map((answer) {
                                widget.question.answers.forEach((_) {
                                  widget.answercontrollers.add(
                                    TextEditingController(),
                                  );
                                });

                                return SizedBox(
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Dimensions.paddingSizeDefault,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.grain_rounded,
                                            color: Theme.of(context).hintColor,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: Dimensions
                                                .paddingSizeExtraSmall,
                                          ),
                                          Expanded(
                                            child: CustomTextField(
                                              controller:
                                                  widget.answercontrollers[
                                                      answer.key],
                                              hintText: answer.value,
                                              fillColor: Colors.transparent,
                                              onChanged: (String value) {
                                                //  answercontrollers[answer.key] = value;
                                                // questions[question.id].answers.add(
                                                //     answercontrollers[answer.key]
                                                //         .text);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.paddingSizeSmall,
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            child: GestureDetector(
                                              onTap: () {
                                                // _deleteAnswer(
                                                //     questionid: question.id,
                                                //     answerid: answer.key);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color:
                                                    Theme.of(context).hintColor,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: Dimensions.paddingSizeSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                // _addAnswer(
                                //     questionid: question.id,
                                //     answer: "Add answer");
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
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

  void _showConfirmationDialog(
    BuildContext context,
    String message,
    Function onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content:
              SingleChildScrollView(child: _DialogWidget(context, onConfirm)),
        );
      },
    );
  }

  Widget _DialogWidget(BuildContext context, Function onConfirm) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Are you sure you want to delete?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.5, color: Theme.of(context).primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Dimensions.radiusDefault),
                        ),
                      ),
                      shadowColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.paddingSizeSmall,
              ),
              SizedBox(
                width: Dimensions.paddingSizeSmall,
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radiusDefault),
                        ),
                      ),
                      shadowColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      onConfirm();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Delete",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppConstants.color2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
