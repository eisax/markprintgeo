import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/data/model/response/survey_Model.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/createsurvey/add_survey_questions.dart';
import 'package:markprintgeo/view/widgets/app_bar_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/custom_switch.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';
import 'package:markprintgeo/view/widgets/toaster_widget.dart';

class CreateSurveyScreen extends StatefulWidget {
  const CreateSurveyScreen({super.key});

  @override
  State<CreateSurveyScreen> createState() => _CreateSurveyScreenState();
}

class _CreateSurveyScreenState extends State<CreateSurveyScreen> {
  int? id;
  TextEditingController title = TextEditingController();
  bool isWelcomeScreen = false;
  TextEditingController welcomeMessage = TextEditingController();
  TextEditingController welcomedescription = TextEditingController();
  TextEditingController buttontext = TextEditingController();
  bool isDoneScreen = false;
  TextEditingController doneMessage = TextEditingController();
  TextEditingController donedescription = TextEditingController();

  int selectedCategory = 0;
  final categoryTypes = [
    "All",
    "Developer",
    "Designer",
    "Auto",
    "Electronics",
    "Fitting",
    "Sewing",
    "Gardening"
  ];
  final jobcategoryTypes = [
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
            "Create New Survey",
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
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeExtraLarge,
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: BouncingScrollBehavior(),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppConstants.color2,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.25),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(Dimensions.paddingSizeSmall),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 0.25,
                                        color: Theme.of(context).dividerColor),
                                  ),
                                ),
                                child: Text(
                                  "title",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    Dimensions.paddingSizeDefault),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: title,
                                      hintText: "title",
                                      fillColor: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppConstants.color2,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.25),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(Dimensions.paddingSizeSmall),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.25,
                                            color: Theme.of(context)
                                                .dividerColor))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Welcome Screen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isWelcomeScreen,
                                      onChanged: (value) {
                                        setState(() {
                                          isWelcomeScreen = value;
                                        });
                                      },
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      backgroundColor:
                                          Theme.of(context).disabledColor,
                                      width: 35.0,
                                      height: 20.0,
                                      padding: EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    Dimensions.paddingSizeDefault),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    Text(
                                      "Welcome Message",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: welcomeMessage,
                                      hintText: "Welcome message",
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: welcomedescription,
                                      hintText: "Description",
                                      fillColor: Colors.transparent,
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    Text(
                                      "Button",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: buttontext,
                                      hintText: "Button text",
                                      fillColor: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppConstants.color2,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.25),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(Dimensions.paddingSizeSmall),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 0.25,
                                        color: Theme.of(context).dividerColor),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Thank you Screen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isDoneScreen,
                                      onChanged: (value) {
                                        setState(() {
                                          isDoneScreen = value;
                                        });
                                      },
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      backgroundColor:
                                          Theme.of(context).disabledColor,
                                      width: 35.0,
                                      height: 20.0,
                                      padding: EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    Dimensions.paddingSizeDefault),
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: doneMessage,
                                      hintText: "Question title",
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                    CustomTextField(
                                      controller: donedescription,
                                      hintText: "Description",
                                      fillColor: Colors.transparent,
                                    ),
                                    SizedBox(
                                      height: Dimensions.paddingSizeSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
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
                        Radius.circular(5),
                      ),
                    ),
                    shadowColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () async {
                    print("");
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
                      Radius.circular(5),
                    ),
                  ),
                  shadowColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  if (title.text.isEmpty) {
                    Toaster(
                      type: ToasterType.error,
                      message: "Please enter Survey title",
                    ).show(context);
                  } else if (isWelcomeScreen) {
                    if (welcomeMessage.text.isEmpty) {
                      Toaster(
                        type: ToasterType.error,
                        message: "Please  enter Survey welcome message",
                      ).show(context);
                    } else if (welcomedescription.text.isEmpty) {
                      Toaster(
                        type: ToasterType.error,
                        message: "Please  enter Survey welcome description",
                      ).show(context);
                    } else if (buttontext.text.isEmpty) {
                      Toaster(
                        type: ToasterType.error,
                        message: "Please  enter Survey button text",
                      ).show(context);
                    }
                  } else if (isDoneScreen) {
                    if (doneMessage.text.isEmpty) {
                      Toaster(
                        type: ToasterType.error,
                        message: "Please  enter Survey thank you message",
                      ).show(context);
                    } else if (donedescription.text.isEmpty) {
                      Toaster(
                        type: ToasterType.error,
                        message: "Please  enter Survey thank you description",
                      ).show(context);
                    }
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSurveyQuestionScreen(
                          survey: Survey(
                            id: 1,
                            title: title.text,
                            isWelcomeScreen: isWelcomeScreen,
                            welcomeMessage: welcomeMessage.text,
                            welcomedescription: welcomedescription.text,
                            buttontext: buttontext.text,
                            isDoneScreen: isDoneScreen,
                            doneMessage: doneMessage.text,
                            donedescription: donedescription.text,
                          ),
                        ),
                      ),
                    );
                  }
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
}
