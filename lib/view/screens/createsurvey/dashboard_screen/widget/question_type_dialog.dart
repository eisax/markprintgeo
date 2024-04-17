import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/survey_controller.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/dashboard_screen/widget/clickable_title_button.dart';


class BottomQuestionDialogHelper {
  static void showGeneralDialog(BuildContext context) {
    showModalBottomSheet(
       isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<SurveyController>(builder: (surveyController) {
          return SingleChildScrollView(
           child:Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.25),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.25),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall,
                    ),
                    child: Row(
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
