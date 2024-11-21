import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

class NavigationPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GlobalKey<ScaffoldState> scaffoldKey;
  NavigationPage(
      {super.key, required this.navigationShell, required this.scaffoldKey});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  void goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: widget.scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar: customBottomNavigationBar());
  }

  Container customBottomNavigationBar() {
    return Container(
      constraints: BoxConstraints(maxHeight: 55, maxWidth: double.infinity),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                selectedIndex = 0;
                goToBranch(selectedIndex);
              },
              child: customNavigationBarItem(
                  Icons.home_outlined, "Home", selectedIndex == 0)),
          InkWell(
              onTap: () {
                selectedIndex = 1;
                goToBranch(selectedIndex);
              },
              child: customNavigationBarItem(
                  Icons.task_outlined, "Task", selectedIndex == 1)),
          InkWell(
            onTap: () {
              selectedIndex = 2;
              goToBranch(selectedIndex);
            },
            child: customNavigationBarItem(
                Icons.account_circle_outlined, "Profile", selectedIndex == 2),
          ),
        ],
      ),
    );
  }

  Column customNavigationBarItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: isSelected ? 35 : 0,
          height: 2,
          color: greenColor,
        ),
        Icon(
          icon,
          color: isSelected ? greenColor : Colors.white54,
          size: 28,
        ),
        Text(
          label,
          style: regularTextStyle.copyWith(
              fontSize: 12, color: isSelected ? greenColor : Colors.white54),
        )
      ],
    );
  }
}
