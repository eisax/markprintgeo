import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/util/style.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    useremail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSizeExtraLarge,
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Text(
                    'Create Geotagged Survey',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppConstants.color6,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimensions.defaultSpacing,
                  ),
                  Text(
                    'Simple and convinient service will help you create a survey and conduct research',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppConstants.color6.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.9,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      shadowColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Get.offAllNamed(RouteHelper.dashboard);
                    },
                    child: Text(
                      'Get Started',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppConstants.color2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
