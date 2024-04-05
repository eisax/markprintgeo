import 'dart:async';
import 'package:flutter/material.dart';
import 'package:markprintgeo/data/api/api_client.dart';
import 'package:markprintgeo/data/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/view/screens/auth/authscreen.dart';
import 'package:markprintgeo/view/screens/auth/widgets/signinscreen.dart';
import 'package:markprintgeo/view/screens/dashboard/dashboard_screen.dart';

enum AuthStatus { signedOut, signedIn }

class AuthController extends GetxController implements GetxService {
  AuthRepo authRepo;
  final ApiClient apiClient;
  AuthController({
    required this.apiClient,
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(BuildContext context,
      {String? email, String? password}) async {
    _isLoading = true;
    update();

    Response response =
        await authRepo.login(apiClient, email: email, password: password);

    if (response.statusCode == 200) {
      Map map = response.body;
      String token = map["data"]["token"];
      print("----------------token:${token}");
      await authRepo.saveAuthToken(token);
      _isLoading = false;
      update();
      return true;
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }

  Future<AuthStatus> authCheck() async {
    _isLoading = true;
    update();

    String? authToken = await authRepo.getAuthToken();

    if (authToken == null || authToken.isEmpty) {
      return AuthStatus.signedOut;
    } else {
      return AuthStatus.signedIn;
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    _isLoading = true;
    update();

    await authRepo
        .deleteAuthToken()
        .then((value) => {Get.offAllNamed(RouteHelper.auth)});

    _isLoading = false;
    update();
  }
}