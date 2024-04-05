import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';

class SurveySettingsScreen extends StatefulWidget {
  const SurveySettingsScreen({super.key});

  @override
  State<SurveySettingsScreen> createState() => _SurveySettingsScreenState();
}

class _SurveySettingsScreenState extends State<SurveySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 130,
        leading: Center(
          child: Text(
            "markprintgeo",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: Dimensions.paddingSizeSmall,
          ),
          const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
            width: Dimensions.paddingSizeSmall,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.brown,
            child: Text(
              "K",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSizeDefault,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
