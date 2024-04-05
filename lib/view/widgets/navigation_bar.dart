import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/app_constants.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/util/images.dart';
import 'package:markprintgeo/view/screens/dashboard/dashboard_screen.dart';
import 'package:markprintgeo/view/screens/shared/shared_survey_screen.dart';
import 'package:markprintgeo/view/screens/surveys/surveys_screen.dart';
import 'package:markprintgeo/view/screens/queueddata/queueddata.dart';
import 'package:markprintgeo/view/screens/profile/profilescreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeDashboardScreen(),
    const SharedSurveys(),
    const QueuedDataScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: Get.width * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(0, Images.home, context),
            buildBottomNavItem(1, Images.history, context),
            buildBottomCenterNavItem(Icons.add, context),
            buildBottomNavItem(2, Images.cloud, context),
            buildBottomNavItem(3, Images.settings, context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(int index, String icon, BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 1000),
      alignment: Alignment.center,
      child: GestureDetector(
        
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 18,
                  height: 18,
                  color: _selectedIndex == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraSmall,
                ),
                AnimatedContainer(
                  duration: Duration(microseconds: 1000),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          _selectedIndex == index ? Theme.of(context).primaryColor : null),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomCenterNavItem(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.createsurveydashboard);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
