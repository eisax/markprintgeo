import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/app_bar_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/custom_switch.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class ViewSurveyScreen extends StatefulWidget {
  const ViewSurveyScreen({super.key});

  @override
  State<ViewSurveyScreen> createState() => _ViewSurveyScreenState();
}

class _ViewSurveyScreenState extends State<ViewSurveyScreen> {
  int selectedCategory = 0;
  bool isChatsed = false;
  bool rememberMe = false;
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
            "View Sur",
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
                                      controller: TextEditingController(),
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
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value;
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
                                      controller: TextEditingController(),
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
                                      controller: TextEditingController(),
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
                                      controller: TextEditingController(),
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
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value;
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
                                      controller: TextEditingController(),
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
                                      controller: TextEditingController(),
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
                         SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                         SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: Get.width,
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
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
                  print("");
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
