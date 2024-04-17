import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/controller/auth_controller.dart';
import 'package:markprintgeo/helper/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _route() async {
    Timer(const Duration(microseconds: 1), () async {
      AuthStatus authStatus = await Get.find<AuthController>().authCheck();

      if (authStatus == AuthStatus.signedIn) {
        Get.offAllNamed(RouteHelper.dashboard);
      }

      if (authStatus == AuthStatus.signedOut) {
        Get.offAllNamed(RouteHelper.auth);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _route();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Theme.of(context).cardColor,
        child: const Center(
          child: Text("markprintgeo"),
        ),
      ),
    );
  }
}
