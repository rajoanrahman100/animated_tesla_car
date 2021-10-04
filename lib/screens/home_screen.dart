import 'package:animated_tesla_car/components/battery_status.dart';
import 'package:animated_tesla_car/components/door_lock.dart';
import 'package:animated_tesla_car/components/tesla_bottom_nav.dart';
import 'package:animated_tesla_car/constants.dart';
import 'package:animated_tesla_car/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  var homeController = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  void setUpBatteryAnimation() {
    _batteryAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    //This animation will start in 0 and end on half
    _animationBattery = CurvedAnimation(parent: _batteryAnimationController, curve: const Interval(0.0, 0.5));
    _animationBatteryStatus = CurvedAnimation(parent: _batteryAnimationController, curve: const Interval(0.6, 1.0));
  }

  @override
  void initState() {
    // TODO: implement initState
    setUpBatteryAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _batteryAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return AnimatedBuilder(
        animation: Listenable.merge([homeController, _batteryAnimationController]),
        builder: (context, snapshot) {
          // print(_animationBattery.value);
          return Scaffold(
            backgroundColor: Colors.black,

            //Added the bottom nav bar

            bottomNavigationBar: TeslaBottomNavBar(
              onTap: (value) {
                //We need to began the animation on Tap
                if (value == 1) {
                  _batteryAnimationController.forward();
                } else if (homeController.selectedBottomNav == 1 && value != 1) {
                  _batteryAnimationController.reverse();
                }
                homeController.onBottomNavigationTabChange(value);
              },
              selectedTab: homeController.selectedBottomNav,
            ),
            body: SafeArea(child: LayoutBuilder(builder: (context, constrains) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/car_two.png",
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  AnimatedPositioned(
                      duration: duration,
                      right:
                          homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.10 : constrains.maxWidth / 2,
                      //No we need to animate the lock, once the user click on it
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: homeController.selectedBottomNav == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () {
                            homeController.updateRightDoorLock();
                          },
                          isLock: homeController.isRightDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: duration,
                      left:
                          homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.10 : constrains.maxWidth / 2,

                      //No we need to animate the lock, once the user click on it
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: homeController.selectedBottomNav == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () {
                            homeController.updateLeftDoorLock();
                          },
                          isLock: homeController.isLeftDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: duration,
                      top: homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.30 : constrains.maxWidth / 2,

                      //No we need to animate the lock, once the user click on it
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: homeController.selectedBottomNav == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () {
                            homeController.updateTopDoorLock();
                          },
                          isLock: homeController.isTopDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: duration,
                      bottom:
                          homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.50 : constrains.maxWidth / 2,

                      //No we need to animate the lock, once the user click on it
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: homeController.selectedBottomNav == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () {
                            homeController.updateBottomDoorLock();
                          },
                          isLock: homeController.isBottomDoorLock,
                        ),
                      )),

                  //Add the battery status

                  Opacity(
                    opacity: _animationBattery.value,
                    child: SvgPicture.asset(
                      "assets/images/Battery.svg",
                      width: constrains.maxWidth * 0.3,
                    ),
                  ),

                  Opacity(
                      opacity: _animationBatteryStatus.value,
                      child: BatteryStatus(
                        boxConstraints: constrains,
                      )),
                ],
              );
            })),
          );
        });
  }
}
