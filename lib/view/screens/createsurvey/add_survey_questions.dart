import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/widgets/question_form_widget.dart';
import 'package:markprintgeo/view/screens/surveys/survey.dart';

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

  String questionType = "single_line";
  List<QuestionModel> questions = [];

  @override
  void initState() {
    super.initState();
    // _addQuestion(
    //   QuestionModel(
    //     id: questions.isNotEmpty ? questions.last.id + 1 : 0,
    //     question: "Enter question",
    //     questionType: "Choice",
    //     description: "description",
    //     answers: ["Text answer"],
    //   ),
    // );
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
        ), 
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
                // Column(
                //   children: questions.asMap().entries.map((question) {
                //     return QuestionInputTemplate(
                //       answercontrollers: answercontrollers,
                //       isrequired: isrequired,
                //       question: questions[question.key],
                //       questionType: questionType,
                //       questions: questions,
                //     );
                //   }).toList(),
                // ),
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
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.normal),
                  shape:  CircleBorder(
                    
                  ),
                  shadowColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  // print(jsonEncode(widget.survey));
                },
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ),
          ],
        ),
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

