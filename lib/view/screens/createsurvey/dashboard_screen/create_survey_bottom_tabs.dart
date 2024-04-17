import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/createsurvey/create_survey_screen.dart';
import 'package:markprintgeo/view/screens/createsurvey/createsurveytheme/create_survey_theme_screen.dart';
import 'package:markprintgeo/view/screens/createsurvey/dashboard_screen/widget/question_type_dialog.dart';
import 'package:markprintgeo/view/screens/createsurvey/previewsurvey/preview_survey.dart';
import 'package:markprintgeo/view/screens/createsurvey/survey_settings/survey_settings_screen.dart';


class CreateSurveyDashboardScreen extends StatefulWidget {
  const CreateSurveyDashboardScreen({super.key});

  @override
  State<CreateSurveyDashboardScreen> createState() =>
      _CreateSurveyDashboardScreenState();
}

class _CreateSurveyDashboardScreenState
    extends State<CreateSurveyDashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const CreateSurveyScreen(),
    const PreviewSurvey(),
    const CreateSurveyThemeScreen(),
    const SurveySettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: Get.width * 0.15,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(0, Icons.edit, "Craete", context),
            buildBottomNavItem(1, Icons.visibility, "Preview", context),
            _selectedIndex == 0
                ? buildBottomCenterNavItem(Icons.add, context)
                : buildBottomNavItem(2, Icons.color_lens, "Theme", context),
            buildBottomNavItem(3, Icons.settings, "Settings", context),
            buildBottomNavItem(4, Icons.send, "Submit", context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(
      int index, IconData icon, title, BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return AnimatedAlign(
        duration: const Duration(milliseconds: 1000),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (index == 1) {
              if (surveyController.validateSurveyForm(context)) {
                _onItemTapped(index);
              }
            } else if (index == 4) {
              //submit survey button
              //print(surveyController.mysurvey.toJson());
            } else {
              _onItemTapped(index);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: _selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraSmall,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: Dimensions.fontSizeExtraSmall,
                          color: _selectedIndex == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget buildBottomCenterNavItem(IconData icon, BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return GestureDetector(
        onTap: () {
          BottomQuestionDialogHelper.showGeneralDialog(context);
        },
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    });
  }
}
