import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/create_survey.dart';
import 'package:markprintgeo/view/screens/createsurvey/preview_survey.dart';
import 'package:markprintgeo/view/screens/createsurvey/survey_settings/survey_settings_screen.dart';

import 'package:markprintgeo/view/widgets/bottom_modal_widget.dart';

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
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(0, Icons.edit, "Craete", context),
            buildBottomNavItem(1, Icons.visibility, "Preview", context),
            buildBottomCenterNavItem(Icons.add, context),
            buildBottomNavItem(2, Icons.settings, "Settings", context),
            buildBottomNavItem(3, Icons.send, "Submit", context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(
      int index, IconData icon, title, BuildContext context) {
    return GetBuilder<SurveyController>(builder: (surveyController) {
      return AnimatedAlign(
        duration: Duration(milliseconds: 1000),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (index == 1) {
              if (surveyController.validateSurveyForm(context)) {
                _onItemTapped(index);
              }
            } else if(index==3){
              print(surveyController.mysurvey.toJson());
            }
            
            
            else {
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
          cardSettingsDialog(context);
        },
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
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

  void cardSettingsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<SurveyController>(builder: (surveyController) {
          return BottomModalWidget(
            widget: Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("short_answer");
                            Navigator.pop(context);
                          },
                          title: 'Short Answer',
                          icon: Icons.list,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("email");
                            Navigator.pop(context);
                          },
                          title: 'Email',
                          icon: Icons.email,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("long_answer");
                            Navigator.pop(context);
                          },
                          title: 'Long Answer',
                          icon: Icons.list,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("number");
                            Navigator.pop(context);
                          },
                          title: 'Number',
                          icon: Icons.numbers,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("multiple_choice");
                            Navigator.pop(context);
                          },
                          title: 'Multiple Choice',
                          icon: Icons.select_all,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController
                                .addQuestion("multiple_choice_grid");
                            Navigator.pop(context);
                          },
                          title: 'Multiple Choice Grid',
                          icon: Icons.grid_goldenratio,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("checkboxes");
                            Navigator.pop(context);
                          },
                          title: 'Checkboxes',
                          icon: Icons.done,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("checkbox_grid");
                            Navigator.pop(context);
                          },
                          title: 'Checkbox Grid',
                          icon: Icons.grid_on,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("dropdown");
                            Navigator.pop(context);
                          },
                          title: 'Dropdown',
                          icon: Icons.arrow_drop_down_circle_rounded,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("linear_scale");
                            Navigator.pop(context);
                          },
                          title: 'Linear Scale',
                          icon: Icons.linear_scale,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.25),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("star_rating");
                            Navigator.pop(context);
                          },
                          title: 'Star Rating',
                          icon: Icons.star,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("smile");
                            Navigator.pop(context);
                          },
                          title: 'Smile',
                          icon: Icons.face,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.25),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("date");
                            Navigator.pop(context);
                          },
                          title: 'Date',
                          icon: Icons.calendar_month,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {},
                          title: 'Time',
                          icon: Icons.timelapse,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("file_upload");
                            Navigator.pop(context);
                          },
                          title: 'File Upload',
                          icon: Icons.upload_file,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClickableIconTitleButton(
                          onTap: () {
                            surveyController.addQuestion("add_section");
                            Navigator.pop(context);
                          },
                          title: 'Add Section',
                          icon: Icons.face,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

class ClickableIconTitleButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  const ClickableIconTitleButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
              ),
              SizedBox(
                width: Dimensions.paddingSizeExtraSmall,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
