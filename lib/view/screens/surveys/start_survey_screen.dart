import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markprintgeo/data/model/response/survey_model.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_dropdown_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/multiple_selection_widget.dart';
import 'package:markprintgeo/view/widgets/selection_widget.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

class StartSurveyScreen extends StatefulWidget {
  const StartSurveyScreen({super.key});

  @override
  State<StartSurveyScreen> createState() => _StartSurveyScreenState();
}

class _StartSurveyScreenState extends State<StartSurveyScreen> {
  // List<TextEditingController> responsescontrollers = [];
  Map<int, TextEditingController> responsesControllers = {};
  List<QuestionModel> questions = [];
  String selectedValue = '';
  List<File> _images = [];
  String locationUsed = "GPS";
  bool isLocationGenerated = false;
  Placemark? placemark;
  

  Future<void> _pickImage(bool isCamera) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _deleteImage(File image) async {
    setState(() {
      _images.remove(image);
    });
  }

  Future<Placemark?> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return null;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      return placemark;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    questions = [
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "What is your name?",
        questionType: "Single Line Text",
        description: "enter your name",
        answers: [],
      ),
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "Which year were you born?",
        questionType: "DropDown List",
        description: "year born",
        answers: [
          "1995",
          "1996",
          "1997",
          "1998",
          "1999",
          "2000",
          "2001",
          "2002",
          "2003",
          "2004",
          "2005",
          "2006"
        ],
      ),
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "Do you like women?",
        questionType: "Choice",
        description: "answer with yes or no",
        answers: ["Yes", "No"],
      ),
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "Describe yourself in 5 words.",
        questionType: "Single Line Text",
        description: "description",
        answers: [],
      ),
      QuestionModel(
        id: questions.isNotEmpty ? questions.last.id + 1 : 0,
        question: "Which one do you prefer",
        questionType: "Choice",
        description: "description",
        answers: ["Chicken", "Beef", "Pork", "Mutton"],
      ),
    ];
  }

  void _addQuestion(QuestionModel question) async {
    setState(() {
      questions.add(question);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (placemark != null) {
      setState(() {
        isLocationGenerated = true;
      });
    } else {
      setState(() {
        isLocationGenerated = false;
      });
    }
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
              Icons.arrow_forward_ios_sharp,
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
          padding: EdgeInsets.only(
              top: Dimensions.paddingSizeDefault,
              left: Dimensions.paddingSizeDefault,
              right: Dimensions.paddingSizeDefault),
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                Container(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleSelectWidget(
                          selectionWidgetList: ["GPS", "Manual"],
                          onSelectionChanged: (value) {
                            setState(() {
                              locationUsed = value;
                            });

                            print(locationUsed);
                          },
                          selectedWidget: locationUsed,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.defaultSpacing,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                placemark = null;
                              });
                              try {
                                placemark = await _getCurrentLocation();
                                setState(()  {
                                  placemark;
                                });
                                print(
                                    "---------------> location generation success");
                              } catch (e) {
                                print(e.toString());
                                print(
                                    "---------------> location generation failed");
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              width: Get.width * 0.45,
                              padding:
                                  EdgeInsets.all(Dimensions.paddingSizeDefault),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: isLocationGenerated
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                  SizedBox(
                                    width: Dimensions.defaultSpacing,
                                  ),
                                  Text(
                                    "Track",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                Dimensions.paddingSizeExtraSmall),
                            child: Text(
                              "Accuracy:2m",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.defaultSpacing,
                ),
                SizedBox(
                  height: Dimensions.defaultSpacing,
                ),
                //custombody
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: questions.asMap().entries.map((question) {
                      if (question.value.questionType == "Single Line Text") {
                        responsesControllers[question.value.id] =
                            TextEditingController();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.value.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeSmall),
                              child: CustomTextField(
                                maxLines: 4,
                                controller:
                                    responsesControllers[question.value.id] ??
                                        TextEditingController(),
                                hintText: question.value.description,
                                fillColor: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }

                      if (question.value.questionType == "Choice") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.value.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeSmall),
                              child: Container(
                                child: SizedBox(
                                  width: Get.width,
                                  child: SingleSelectWidget(
                                    selectionWidgetList: question.value.answers,
                                    onSelectionChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    selectedWidget: selectedValue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      if (question.value.questionType == "DropDown List") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.value.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeSmall),
                              child: SizedBox(
                                width: Get.width,
                                child: CustomDropdownWidget(
                                  selectionWidgetList: question.value.answers,
                                  selectedWidget: question.value.answers[0],
                                  onSelectionChanged: (String value) {},
                                ),
                              ),
                            ),
                          ],
                        );
                      } else
                        return Container();
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeLarge,
                ),
                //footer
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Photo",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppConstants.color5),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      Container(
                        width: Get.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _images
                                .map(
                                  (image) => Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.paddingSizeExtraSmall),
                                    margin: EdgeInsets.all(
                                      Dimensions.paddingSizeExtraSmall,
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(image),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 0.2,
                                            color: Theme.of(context)
                                                .dividerColor)),
                                    height: Get.width * 0.3,
                                    width: Get.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(
                                            2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.paddingSizeExtraSmall,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.image_outlined,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              Dimensions.paddingSizeExtraSmall,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _deleteImage(image);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                              2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .hintColor
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions
                                                    .paddingSizeExtraSmall,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.delete_outline,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.2,
                              color: Theme.of(context).dividerColor),
                          borderRadius: BorderRadius.circular(
                            Dimensions.radiusDefault,
                          ),
                        ),
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
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.5,
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(Dimensions.radiusSmall),
                                      ),
                                    ),
                                    shadowColor: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    await _pickImage(false);
                                  },
                                  child: Text(
                                    "Album",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
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
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.radiusSmall),
                                      ),
                                    ),
                                    shadowColor: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    await _pickImage(true);
                                  },
                                  child: Text(
                                    "Camera",
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
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SizedBox(
          height: Dimensions.defaultButtonHeight,
          width: Get.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              textStyle: const TextStyle(
                  color: Colors.white, fontStyle: FontStyle.normal),
              shape: const RoundedRectangleBorder(
                side: BorderSide(width: 0.5, color: AppConstants.color2),
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radiusSmall),
                ),
              ),
              shadowColor: Theme.of(context).primaryColor,
            ),
            onPressed: () async {
              print(placemark.toString());
              // List<String> nonEmptyAnswers = responsesControllers.values
              //     .map((controller) => controller.text)
              //     .where((answer) => answer.isNotEmpty)
              //     .toList();
              // print(nonEmptyAnswers);
            },
            child: Text(
              "Done Surveying",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppConstants.color2),
            ),
          ),
        ),
      ),
    );
  }
}
