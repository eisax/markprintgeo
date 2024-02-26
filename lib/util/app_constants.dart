import 'package:flutter/material.dart';
import 'package:markprintgeo/data/model/language_model.dart';

class AppConstants {
  //app data
  static const String appName = 'markprintgeo';
  static const String appVersion = '1.0';

  // Shared Key
  static const String theme = 'theme';

  //colors
  static const Color color1 = Color(0xFF312F81);
  static const Color color2 = Color(0xFFFFFFFF);
  static const Color color3 = Color(0xFFA8A8D0);
  static const Color color4 = Color(0xFF6982FA);
  static const Color color5 = Color(0xFF0E0C14);
  static const Color color6 = Color(0xFF0E0C14);
  static const Color color7 = Color(0xFFFF3737);
  static const Color color8 = Color(0xFFF57600);
  static const Color color9 = Color(0xFF00B907);
  static const Color color10 = Color(0xFF0097EC);

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(
        languageName: 'Shona', countryCode: 'ZW', languageCode: 'ar'),
  ];
}
