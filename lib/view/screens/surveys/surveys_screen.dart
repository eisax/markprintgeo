// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int selectedCategory = 0;
  bool selectedApp = false;
  final workspaces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Container(),
        title: Center(
          child: Text(
            "Survey history",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppConstants.color2),
          ),
        ), // Title
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: AppConstants.color2,
              size: 16,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color: AppConstants.color3.withOpacity(0.1),
                  border: Border.all(
                      width: 0.1, color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedApp = !selectedApp;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedApp
                                        ? Theme.of(context).primaryColor
                                        : AppConstants.color2,
                                    border: Border.all(
                                      width: 0.1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  child: selectedApp
                                      ? const Center(
                                          child: Icon(
                                            Icons.done,
                                            color: AppConstants.color2,
                                            size: 12,
                                          ),
                                        )
                                      : null,
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Text(
                            "ID",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: AppConstants.color5),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Text(
                            "Name",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: AppConstants.color5),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Text(
                            "Due",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: AppConstants.color5),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Text(
                            "",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: AppConstants.color5),
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: workspaces.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeDefault),
                        width: Get.width,
                        child: ScrollConfiguration(
                          behavior: BouncingScrollBehavior(),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: RefreshIndicator(
                              color: Theme.of(context).primaryColor,
                              onRefresh: _pullRefresh,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width,
                                    child: ScrollConfiguration(
                                      behavior: BouncingScrollBehavior(),
                                      child: Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: workspaces
                                                .asMap()
                                                .entries
                                                .map(
                                                  (entry) => Container(
                                                    padding: EdgeInsets.all(
                                                      Dimensions
                                                          .paddingSizeExtraSmall,
                                                    ),
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                      color: AppConstants.color2
                                                          .withOpacity(0.1),
                                                      border: Border.all(
                                                          width: 0.025,
                                                          color: Theme.of(
                                                                  context)
                                                              .dividerColor),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                Dimensions
                                                                    .paddingSizeExtraSmall,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectedApp =
                                                                            !selectedApp;
                                                                      });
                                                                    },
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color: selectedApp
                                                                            ? AppConstants.color1
                                                                            : AppConstants.color2,
                                                                        border:
                                                                            Border.all(
                                                                          width:
                                                                              0.1,
                                                                          color:
                                                                              Theme.of(context).dividerColor,
                                                                        ),
                                                                      ),
                                                                      child: selectedApp
                                                                          ? const Center(
                                                                              child: Icon(
                                                                                Icons.done,
                                                                                color: AppConstants.color2,
                                                                                size: 12,
                                                                              ),
                                                                            )
                                                                          : null,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                Dimensions
                                                                    .paddingSizeExtraSmall,
                                                              ),
                                                              child: Text(
                                                                entry.key
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.copyWith(
                                                                        color: AppConstants
                                                                            .color5),
                                                              ),
                                                            )),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                Dimensions
                                                                    .paddingSizeExtraSmall,
                                                              ),
                                                              child: Text(
                                                                entry.value,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.copyWith(
                                                                        color: AppConstants
                                                                            .color5),
                                                              ),
                                                            )),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                              Dimensions
                                                                  .paddingSizeExtraSmall,
                                                            ),
                                                            child: Text(
                                                              "23-02-2024",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelSmall
                                                                  ?.copyWith(
                                                                      color: AppConstants
                                                                          .color5),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                              Dimensions
                                                                  .paddingSizeExtraSmall,
                                                            ),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons.done,
                                                                color:
                                                                    AppConstants
                                                                        .color9,
                                                                size: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Images.cry,
                            width: 76,
                            height: 76,
                            color: Theme.of(context).disabledColor,
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeLarge,
                          ),
                          Text(
                            "No Data Collected",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
   // print("------------------------REFRESHED-----------------");
  }
}
