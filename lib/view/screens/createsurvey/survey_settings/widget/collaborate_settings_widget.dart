// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';

class collaborateSettingsWidget extends StatefulWidget {
  const collaborateSettingsWidget({super.key});

  @override
  State<collaborateSettingsWidget> createState() =>
      _collaborateSettingsWidgetState();
}

class _collaborateSettingsWidgetState extends State<collaborateSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
      color: Theme.of(context).cardColor,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                              "Collaboration",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: Get.width * 0.7,
                              child: Text(
                                "Do you want to share this form with others?",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                Dimensions.paddingSizeSmall,
              ),
              margin: const EdgeInsets.only(left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                borderRadius: BorderRadius.all(Radius.circular(
                                    Dimensions.radiusExtraLarge))),
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {},
                          child: Text(
                            "Add Collaborator",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ["eisaxoffice@gmail.com"]
                        .map((email) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeDefault,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.brown.withOpacity(0.5),
                                    radius: 15,
                                    child: Center(
                                      child: Text(
                                        email[0].toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              
                                                color:
                                                    Colors.white,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.paddingSizeSmall,
                                  ),
                                  Text(
                                    email,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            fontStyle: FontStyle.italic,
                                            color: Theme.of(context).hintColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
