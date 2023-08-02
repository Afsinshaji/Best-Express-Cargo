import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 300), // Set the desired duration for the animation
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves
          .easeInOut, // You can choose any desired curve for the animation
    );

    _animationController.addListener(() {
      // This method will be called every time the animation value changes.
      setState(() {}); // Rebuild the widget when the animation value changes.
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Edit   ",
          iconColor: whiteShade,
          bubbleColor: logoBlue,
          icon: Icons.edit,
          titleStyle: const TextStyle(fontSize: 18, color: whiteShade),
          onPress: () {},
        ),
        // Floating action menu item
        //Floating action menu item
        Bubble(
          title: "View ",
          iconColor: whiteShade,
          bubbleColor: logoBlue,
          icon: Icons.remove_red_eye,
          titleStyle: const TextStyle(fontSize: 18, color: whiteShade),
          onPress: () {
            _animationController.reverse();
          },
        ),

        Bubble(
          title: "Print  ",
          iconColor: Colors.white,
          bubbleColor: logoBlue,
          icon: Icons.print,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {},
        ),
        Bubble(
          title: "Add    ",
          iconColor: whiteShade,
          bubbleColor: logoBlue,
          icon: Icons.add,
          titleStyle: const TextStyle(fontSize: 16, color: whiteShade),
          onPress: () {},
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: logoBlue,

      // Flaoting Action button Icon
      iconData: Icons.auto_awesome_mosaic_rounded,
      backGroundColor: mainConColor,
    );
  }
}
