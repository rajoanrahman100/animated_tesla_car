import 'package:animated_tesla_car/components/door_lock.dart';
import 'package:animated_tesla_car/components/tesla_bottom_nav.dart';
import 'package:animated_tesla_car/constants.dart';
import 'package:animated_tesla_car/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: homeController,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.black,

            //Added the bottom nav bar

            bottomNavigationBar: TeslaBottomNavBar(
              onTap: (value) {
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
                      right: homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.10 : constrains.maxWidth / 2,
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
                      left: homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.10 : constrains.maxWidth / 2,
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
                      top: homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.50 : constrains.maxWidth / 2,
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
                      bottom: homeController.selectedBottomNav == 0 ? constrains.maxWidth * 0.50 : constrains.maxWidth / 2,
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

                  //Add the batery status
                ],
              );
            })),
          );
        });
  }
}
