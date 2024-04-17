import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';

class CreateSurveyThemeScreen extends StatefulWidget {
  const CreateSurveyThemeScreen({super.key});

  @override
  State<CreateSurveyThemeScreen> createState() =>
      _CreateSurveyThemeScreenState();
}

class _CreateSurveyThemeScreenState extends State<CreateSurveyThemeScreen> {
  int selectedTheme = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> theme = [
      "Default",
      "Dark Mode",
      "Vibrant",
      "Quatz",
      "Business",
      "Tarnzanite",
      "Marble",
      "Red",
      "Green",
      "Blue",
      "Black"
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: Dimensions.defaultSpacing,
          mainAxisSpacing: Dimensions.defaultSpacing,
          children: List.generate(theme.length, (index) {
            return Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedTheme = index;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: Get.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radiusDefault,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  Dimensions.radiusDefault,
                                ),
                                bottomRight:
                                    Radius.circular(Dimensions.radiusDefault)),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              theme[index],
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
                  ),
                ),
                selectedTheme == index
                    ? Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.25),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container()
              ],
            );
          }),
        ),
      ),
    );
  }
}
