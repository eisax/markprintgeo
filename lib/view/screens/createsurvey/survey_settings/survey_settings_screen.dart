import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/createsurvey/survey_settings/widget/collaborate_settings_widget.dart';
import 'package:markprintgeo/view/screens/createsurvey/survey_settings/widget/control_settings_widget.dart';
import 'package:markprintgeo/view/screens/createsurvey/survey_settings/widget/view_settings_widget.dart';

class SurveySettingsScreen extends StatefulWidget {
  const SurveySettingsScreen({super.key});

  @override
  State<SurveySettingsScreen> createState() => _SurveySettingsScreenState();
}

class _SurveySettingsScreenState extends State<SurveySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Expanded(
            child: SizedBox(
              child: DefaultTabController(
                initialIndex: 0,
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.white,
                      dividerColor: Colors.white.withOpacity(0.25),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.5),
                      tabs: <Widget>[
                        Tab(
                          child: Center(
                            child: Text(
                              "VIEW",
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              "CONTROL",
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              "COLLABORATE",
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Expanded(
                            child: ViewSettingsWidget(),
                          ),
                          Expanded(
                            child: ControlSettingsWidget(),
                          ),
                          Expanded(
                            child: collaborateSettingsWidget(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
