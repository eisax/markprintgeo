import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';

class SharedSurveys extends StatefulWidget {
  const SharedSurveys({super.key});

  @override
  State<SharedSurveys> createState() => _SharedSurveysState();
}

class _SharedSurveysState extends State<SharedSurveys> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)),
                  child: Icon(Icons.note_add_sharp,color: Theme.of(context).primaryColor.withOpacity(0.5),),
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault,
            ),
            Text(
              "No Shared Forms Available!",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppConstants.color5,
                  ),
            ),
          ],
        ),
      )),
    );
  }
}
