import 'package:animated_tesla_car/constants.dart';
import 'package:flutter/material.dart';

class TeslaBottomNavBar extends StatelessWidget {
  const TeslaBottomNavBar({Key? key, required this.selectedTab, required this.onTap}) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedTab,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: List.generate(
          itemList.length,
          (index) => BottomNavigationBarItem(
              icon: Icon(
                itemList[index],
                color: index == selectedTab ? kPrimaryColor : Colors.white,
              ),
              label: ""),
        ));
  }
}

final itemList = [
  Icons.lock,
  Icons.battery_charging_full,
  Icons.thermostat_outlined,
  Icons.ac_unit_rounded,
];
