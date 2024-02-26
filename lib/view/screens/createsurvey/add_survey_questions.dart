import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/data/model/response/survey_Model.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';
import 'package:markprintgeo/view/widgets/toaster_widget.dart';

class AddSurveyQuestionScreen extends StatefulWidget {
  final Survey survey;
  const AddSurveyQuestionScreen({super.key, required this.survey});

  @override
  State<AddSurveyQuestionScreen> createState() =>
      _AddSurveyQuestionScreenState();
}

class _AddSurveyQuestionScreenState extends State<AddSurveyQuestionScreen> {
  int? id;
  TextEditingController questiontitle = TextEditingController();
  bool isrequired = false;
  TextEditingController questiondescription = TextEditingController();
  TextEditingController questionmaxcharacters = TextEditingController();
  List<TextEditingController> answercontrollers = [];

  int selectedCategory = 0;
  bool isChatsed = false;
  bool rememberMe = false;

  String questionType = "Single Line Text";
  List<QuestionModel> questions = [];

  @override
  void initState() {
    super.initState();
    _addQuestion(
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "Enter question",
        questionType: "Choice",
        description: "description",
        answers: ["Text answer"],
      ),
    );
  }

  void _addQuestion(QuestionModel question) async {
    setState(() {
      questions.add(question);
    });
  }

  void _addAnswer({required int questionid, required String answer}) {
    setState(() {
      questions[questionid].answers.add(answer);
    });
  }

  void _deleteQuestion({required int questionid}) {
    setState(() {
      questions.removeAt(questionid);
    });
  }

  void _deleteAnswer({required int questionid, required int answerid}) {
    setState(() {
      questions[questionid].answers.removeAt(answerid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppConstants.color2,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ), // Leading icon
        title: Center(
          child: Text(
            widget.survey.title ?? "",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppConstants.color2),
          ),
        ), // Title
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_rounded,
              color: AppConstants.color2,
              size: 16,
            ),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeExtraLarge,
              horizontal: Dimensions.paddingSizeDefault),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Column(
                  children: questions.asMap().entries.map((question) {
                    return questionTemplate(context, questions[question.key]);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppConstants.color7,
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
                    widget.survey.questions = questions;
                  },
                  child: Text(
                    "Cancel",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppConstants.color2),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            SizedBox(
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
                  print(jsonEncode(widget.survey));
                },
                child: Text(
                  "Next",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppConstants.color2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget questionTemplate(BuildContext context, QuestionModel question) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppConstants.color2,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.25),
          width: 0.5,
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
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            width: 0.1,
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${(question.id + 1).toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: AppConstants.color2,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSizeExtraSmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeExtraSmall),
                        decoration: BoxDecoration(
                          color: AppConstants.color3.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 20,
                        child: Center(
                          child: DropdownButton<String>(
                            underline: Container(),
                            hint: Text(
                              "Select Item",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            value: questionType,
                            icon: Container(),
                            onChanged: (String? newValue) {
                              setState(() {
                                questions[question.id].questionType = newValue!;
                              });
                            },
                            items: <String>[
                              'Single Line Text',
                              'Choice',
                              'Multi Line Text',
                              'Image Choice',
                              'Matrix',
                              'File',
                              'DropDown List'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        size: 12,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      SizedBox(
                                        width: Dimensions.paddingSizeExtraSmall,
                                      ),
                                      Text(
                                        value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
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
                          isrequired = !isrequired;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isrequired
                              ? Theme.of(context).primaryColor
                              : AppConstants.color2,
                          border: Border.all(
                            width: 0.1,
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: isrequired
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
                          () => _deleteQuestion(questionid: question.id),
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
                  controller: questiontitle,
                  hintText: "title",
                  fillColor: Colors.transparent,
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
                  controller: questiondescription,
                  hintText: "Description",
                  fillColor: Colors.transparent,
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                if (question.questionType == 'Single Line Text' ||
                    question.questionType == 'Multi Line Text')
                  Column(
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
                        controller: questionmaxcharacters,
                        hintText: "max characters",
                        fillColor: Colors.transparent,
                      ),
                    ],
                  ),
                if (question.questionType == 'Choice' ||
                    question.questionType == 'Matrix' ||
                    question.questionType == 'DropDown List')
                  Column(
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
                        children: questions[question.id]
                            .answers
                            .asMap()
                            .entries
                            .map((answer) {
                          questions[question.id].answers.forEach((_) {
                            answercontrollers.add(TextEditingController());
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
                                      width: Dimensions.paddingSizeExtraSmall,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        controller:
                                            answercontrollers[answer.key],
                                        hintText: answer.value,
                                        fillColor: Colors.transparent,
                                        onChanged: (String value) {
                                          questions[question.id].answers.add(
                                              answercontrollers[answer.key]
                                                  .text);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.paddingSizeSmall,
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      child: GestureDetector(
                                        onTap: () {
                                          _deleteAnswer(
                                              questionid: question.id,
                                              answerid: answer.key);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Theme.of(context).hintColor,
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
                          _addAnswer(
                              questionid: question.id, answer: "Add answer");
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
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(
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
                        shape:  RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.5, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radiusDefault),
                          ),
                        ),
                        shadowColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        print("");
                      },
                      child: Text(
                        "Album",
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
                        if (questiontitle.text.isEmpty) {
                          Toaster(
                            type: ToasterType.error,
                            message: "Please enter Question title",
                          ).show(context);
                        } else {
                          _addQuestion(QuestionModel(
                            id: questions.isNotEmpty
                                ? questions.last.id + 1
                                : 1,
                            question: questiontitle.text,
                            questionType: questionType,
                            description: questiondescription.text,
                            answers: answercontrollers
                                .map((controller) => controller.text)
                                .where((answer) => answer.isNotEmpty)
                                .toList(),
                          ));

                          Toaster(
                            type: ToasterType.error,
                            message: "Question added successfuly",
                          ).show(context);
                        }
                      },
                      child: Text(
                        "Save Changes",
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
          )
        ],
      ),
    );
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
                      shape:  RoundedRectangleBorder(
                        side:
                            BorderSide(width: 0.5, color: Theme.of(context).primaryColor),
                        borderRadius:const BorderRadius.all(
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
