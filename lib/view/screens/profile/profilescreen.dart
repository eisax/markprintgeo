import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/app_bar_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_dropdown_widget.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/custom_switch.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedCategory = 0;
  bool isProfilesed = false;
  bool rememberMe = false;
  String? selectedLanguage ;
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
            "Settings",
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
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape:  RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius:const BorderRadius.all(
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
                                  ?.copyWith(color: Theme.of(context).primaryColor),
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
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape:  RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius:const BorderRadius.all(
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
                                  ?.copyWith(color: Theme.of(context).primaryColor),
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
                    selectionWidgetList: ["English", "Shona","isiNdebele"],
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
  }
}
