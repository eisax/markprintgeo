// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/auth_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/mobileappwrapper/mobile_app_wrapper.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
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
  String? selectedLanguage;
  


  @override
  Widget build(BuildContext context) {
    return MobileAppWraper(
      child: GetBuilder<AuthController>(builder: (authController) {
        return Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ScrollConfiguration(
              behavior: BouncingScrollBehavior(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                ?.copyWith(fontWeight: FontWeight.w500),
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
                                  padding: EdgeInsets.all(
                                      Dimensions.paddingSizeSmall),
                                  width: Get.width * 0.3,
                                  height: Get.width * 0.3,
                                  child: Center(
                                    child: Text(
                                      "0%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontSize:
                                                  Dimensions.fontSizeLarge,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "0B/0.5GB",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).hintColor,
                                ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeSmall,
                          ),
                          SizedBox(
                            height: 35,
                            width: Get.width * 0.4,
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            Dimensions.radiusExtraLarge))),
                                shadowColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () async {
                                // print("");
                              },
                              child: Text(
                                "Manage Storage",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Mobile Data Collection",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: Dimensions.defaultSpacing,
                              ),
                              Text(
                                "Notifications",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
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
                            padding: EdgeInsets.all(
                                Dimensions.paddingSizeExtraSmall),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "FAQ Videos",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Languages",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.feedback,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Feedback",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.note_alt_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Privacy Policy",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Share",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).hintColor.withOpacity(0.25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(
                            width: Dimensions.defaultSpacing,
                          ),
                          Text(
                            "Delete Account",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
