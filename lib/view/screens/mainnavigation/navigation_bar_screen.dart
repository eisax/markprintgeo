import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markprintgeo/helper/route_helper.dart';
import 'package:markprintgeo/util/dimensiona.dart';
import 'package:markprintgeo/view/screens/forms/forms_screen.dart';
import 'package:markprintgeo/view/screens/shared/shared_survey_screen.dart';
import 'package:markprintgeo/view/screens/quiz/quezzes_screen.dart';
import 'package:markprintgeo/view/screens/more/more_screen.dart';
import 'package:markprintgeo/view/widgets/dialog_helper.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const FormsScreen(),
    const QuizzesScreen(),
    const SharedSurveys(),
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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildBottomNavItem(0, Icons.bar_chart_sharp, "Forms", context),
            buildBottomNavItem(1, Icons.notes_sharp, "Quiz", context),
            buildBottomCenterNavItem(Icons.add, context),
            buildBottomNavItem(2, Icons.people, "Shared", context),
            buildBottomNavItem(3, Icons.more_horiz, "More", context),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(
      int index, IconData icon, String title, BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 1000),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: _selectedIndex == index
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraSmall,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: _selectedIndex == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
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
        DialogHelper.showGeneralDialog(
          context,
          child: GestureDetector(
            onTap: () => Get.back(),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClickableCreateSurveyDialog(
                  icon: Icons.bar_chart_sharp,
                  title: 'FORM',
                  subtitle: 'Create New Form/Survey',
                  onTap: (){
                    Get.toNamed(RouteHelper.createsurveydashboard);
                  },
                ),
                const SizedBox(
                  height: Dimensions.defaultSpacing,
                ),
                ClickableCreateSurveyDialog(
                  icon: Icons.notes_sharp,
                  title: 'Quiz',
                  subtitle: 'Create New Quiz',
                  onTap: (){},
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
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

class ClickableCreateSurveyDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function() onTap;
  const ClickableCreateSurveyDialog(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        
        duration: const Duration(milliseconds: 500),
        width: Get.width * 0.7,
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
            color: Colors.white),
        child: Column(
          children: [
            Icon(
              icon,
              size: 60,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor),
            )
          ],
        ),
      ),
    );
  }
}
