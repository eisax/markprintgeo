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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      body: ScrollConfiguration(
        behavior: BouncingScrollBehavior(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            padding: EdgeInsets.only(
                top: Get.height * 0.1,
                left: Dimensions.paddingSizeDefault,
                right: Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 40,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(Images.icon),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Registration 👍",
                          style: TextStyle(
                              fontSize: Dimensions.fontSizeOverLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: Get.width * 0.5,
                      padding: const EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Let's Register, and start browsing",
                          style: TextStyle(
                              fontSize: 16, color: Theme.of(context).hintColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeDefault),
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            hintText: 'Full name',
                            controller: useremail,
                            // errorText: "Please enter your email",
                            borderColor: Theme.of(context).highlightColor,
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'email', controller: userpass,
        
                            // errorText: "Please enter your email",
                            borderColor: Theme.of(context).highlightColor,
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'password', controller: userpass,
                            isPassword: true,
                            // errorText: "Please enter your email",
                            borderColor: Theme.of(context).highlightColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
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
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {},
                        child: const Text(
                          'Register',
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Dimensions.paddingSizeExtraLarge),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed:()=>Get.offAllNamed(RouteHelper.auth),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Have an account?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).hintColor),
                                ),
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                      fontSize: 16, color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
