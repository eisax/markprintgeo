import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/auth_controller.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/app_bar_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_dropdown_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/custom_switch.dart';
import 'package:markprintgeo/view/widgets/dialog_helper.dart';
import 'package:markprintgeo/view/widgets/loading_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedCategory = 0;
  bool isProfilesed = false;
  bool rememberMe = false;
  String? selectedLanguage;
  final profileTypes = [
    "My profile",
    "Notifications",
    "My address",
    "Help",
    "Privacy policy",
    "Logout"
  ];

  final IconData = [
    Icons.person,
    Icons.notifications,
    Icons.location_on,
    Icons.help,
    Icons.privacy_tip,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leadingWidth: 130,
          leading: Center(
            child: Text(
              "markprintgeo",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          actions: [
            const Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.brown,
              child: Text(
                "K",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              width: Dimensions.paddingSizeDefault,
            ),
          ],
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ScrollConfiguration(
            behavior: BouncingScrollBehavior(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Storage",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeExtraSmall,
                        ),
                        Stack(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(Dimensions.paddingSizeSmall),
                              width: Get.width * 0.3,
                              height: Get.width * 0.3,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                value: 0,
                                color: Theme.of(context).primaryColor,
                                backgroundColor: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.5),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding:
                                    EdgeInsets.all(Dimensions.paddingSizeSmall),
                                width: Get.width * 0.3,
                                height: Get.width * 0.3,
                                child: Center(
                                  child: Text(
                                    "0%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontSize: Dimensions.fontSizeLarge,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "0B/0.5GB",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeExtraSmall,
                        ),
                         SizedBox(
                        height: 30,
                        width: Get.width*0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.all(
                                    Radius.circular(Dimensions.radiusExtraLarge))),
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            print("");
                          },
                          child: Text(
                            "Manage Storage",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: Colors.white),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).hintColor.withOpacity(0.25),
                  ),
                  Text(
                    "Mobile Data Collection",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Find your form connected to a project or layer on the map",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Row(
                    children: [
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
                                    Radius.circular(Dimensions.radiusSmall))),
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            print("");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: Dimensions.paddingSizeExtraSmall,
                              ),
                              Text(
                                "Refresh",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Row(
                    children: [
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
                                    Radius.circular(Dimensions.radiusSmall))),
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            print("");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: Dimensions.paddingSizeExtraSmall,
                              ),
                              Text(
                                "Refresh Form",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Application",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Zoom after send",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).disabledColor,
                    width: 35.0,
                    height: 20.0,
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Follow user on map",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).disabledColor,
                    width: 35.0,
                    height: 20.0,
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Send using cellular network",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).disabledColor,
                    width: 35.0,
                    height: 20.0,
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Highest Photo Quality",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).disabledColor,
                    width: 35.0,
                    height: 20.0,
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "Choose Language",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: CustomDropdownWidget(
                      selectionWidgetList: ["English", "Shona", "isiNdebele"],
                      selectedWidget: selectedLanguage,
                      onSelectionChanged: (String value) {
                        setState(() {
                          selectedLanguage = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    "External GPS",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomSwitch(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).disabledColor,
                    width: 35.0,
                    height: 20.0,
                    padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  ),
                ],
              ),
            ),
          ),
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
            "Are you sure you want to logout?",
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
                      "Logout",
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
