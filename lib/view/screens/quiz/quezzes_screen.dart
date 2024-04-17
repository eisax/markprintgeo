import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              width: Dimensions.paddingSizeDefault,
            ),
          ],
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
                Images.notepad,
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: Dimensions.paddingSizeLarge,
              ),
              Text(
                "No Quiz Available",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: Dimensions.paddingSizeLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    "Use Templates",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        
        
        ),
      ),
    );
  }
}
