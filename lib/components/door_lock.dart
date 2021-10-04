import 'package:animated_tesla_car/constants.dart';
import 'package:flutter/material.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({Key? key, required this.press, required this.isLock}) : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        duration: duration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: isLock
            ? const Icon(
          Icons.lock_outline_rounded,
          color: kRedColor,
          size: 35,
          key: ValueKey("lock"),
        )
            : const Icon(
          Icons.lock_open_rounded,
          color: kPrimaryColor,
          size: 35,
          key: ValueKey("unlock"),
        ),
      ),
    );
  }
}
