import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/widgets/app_bar_widget.dart';
import 'package:markprintgeo/view/widgets/bouncing_scroll_physics.dart';
import 'package:markprintgeo/view/widgets/custom_search_widget.dart';
import 'package:markprintgeo/view/widgets/custom_switch.dart';
import 'package:markprintgeo/view/widgets/textinput_widget.dart';

class QueuedDataScreen extends StatefulWidget {
  const QueuedDataScreen({super.key});

  @override
  State<QueuedDataScreen> createState() => _QueuedDataScreenState();
}

class _QueuedDataScreenState extends State<QueuedDataScreen> {
  int selectedCategory = 0;
  bool isChatsed = false;
  bool rememberMe = false;
  final categoryTypes = [
    "All",
    "Developer",
    "Designer",
    "Auto",
    "Electronics",
    "Fitting",
    "Sewing",
    "Gardening"
  ];
  final jobcategoryTypes = [
    "Welding",
    "Security",
    "Shop Keeping",
    "House Keeping",
    "Auto",
    "Electromics",
    "Fitter",
    "Petroleum"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,

        title: Center(
          child: Text(
            "Queued Data",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppConstants.color2),
          ),
        ), // Title
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeExtraLarge,
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Images.smile,
                width: 76,
                height: 76,
               
                color: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: Dimensions.paddingSizeLarge,
              ),
              Text(
                "No pending upload data",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
