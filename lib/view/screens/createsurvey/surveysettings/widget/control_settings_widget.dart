import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/widgets/custom_checkbox_widget.dart';

class ControlSettingsWidget extends StatefulWidget {
  const ControlSettingsWidget({super.key});

  @override
  State<ControlSettingsWidget> createState() => _ControlSettingsWidgetState();
}

class _ControlSettingsWidgetState extends State<ControlSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
      color: Theme.of(context).cardColor,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                Dimensions.paddingSizeSmall,
              ),
              child: Text(
                "General",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_rounded,
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
                              "User Info",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Do you want to get partcipant information?",
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
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Padding(
              padding: EdgeInsets.all(
                Dimensions.paddingSizeSmall,
              ),
              child: Text(
                "Responses",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.copy_all,
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
                              "Allow Multiple Responses",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: Get.width * 0.65,
                              child: Text(
                                "Do you want to allow the user to answer more than once?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                        fontWeight: FontWeight.w400),
                              ),
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
           Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pie_chart,
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
                              "Show Summary",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: Get.width * 0.65,
                              child: Text(
                                "Do you want to allow respondents to view a summary of all responses after submitting?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                        fontWeight: FontWeight.w400),
                              ),
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
          
           SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Padding(
              padding: EdgeInsets.all(
                Dimensions.paddingSizeSmall,
              ),
              child: Text(
                "Questions",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.format_list_numbered,
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
                              "Show Question Number",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: Get.width * 0.65,
                              child: Text(
                                "Show question numbers on the form?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                        fontWeight: FontWeight.w400),
                              ),
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
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shuffle,
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
                              "Shuffle Questions",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: Get.width * 0.65,
                              child: Text(
                                "Do you want to shuffle the form questions?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context).hintColor,
                                        fontWeight: FontWeight.w400),
                              ),
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
