import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/widgets/custom_checkbox_widget.dart';

class ViewSettingsWidget extends StatefulWidget {
  const ViewSettingsWidget({super.key});

  @override
  State<ViewSettingsWidget> createState() => _ViewSettingsWidgetState();
}

class _ViewSettingsWidgetState extends State<ViewSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
      color: Theme.of(context).cardColor,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //change theme
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.color_lens,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Change Theme",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Tap here to choose theme",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),
                      Container(
                        width: Get.width * 0.4,
                        height: Get.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radiusDefault,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: Theme.of(context).cardColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              padding: EdgeInsets.all(
                                  Dimensions.paddingSizeExtraSmall),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                      Dimensions.radiusDefault,
                                    ),
                                    bottomRight: Radius.circular(
                                        Dimensions.radiusDefault)),
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  "Default",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    
                    ],
                  ),
                ],
              ),
            ),
            //Show Logo
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_2_sharp,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSpacing,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Show Logo",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Do you want to show logo in the form?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomCheckboxWidget(
                          isSelected: false,
                          onChanged: (bool value) {},
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: Theme.of(context).cardColor,
                          width: 20.0,
                          height: 20.0,
                          padding: const EdgeInsets.all(4.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Show Welcome page
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSpacing,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Page",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Do you want to show welcome page?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Start button",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomCheckboxWidget(
                          isSelected: false,
                          onChanged: (bool value) {},
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: Theme.of(context).cardColor,
                          width: 20.0,
                          height: 20.0,
                          padding: const EdgeInsets.all(4.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Estimated Time
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSpacing,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Estimated Time",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Do you want to show estimated time?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomCheckboxWidget(
                          isSelected: false,
                          onChanged: (bool value) {},
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: Theme.of(context).cardColor,
                          width: 20.0,
                          height: 20.0,
                          padding: const EdgeInsets.all(4.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Estimated Time
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSpacing,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question Count",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Do you want to show question count?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomCheckboxWidget(
                          isSelected: false,
                          onChanged: (bool value) {},
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: Theme.of(context).cardColor,
                          width: 20.0,
                          height: 20.0,
                          padding: const EdgeInsets.all(4.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
