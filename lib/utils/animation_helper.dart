import 'dart:math';

import 'package:flutter/material.dart';

class AnimationHelper {
  static Animation<double> moveToBack(AnimationController _controller) {
    return TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: pi / 2)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 50.0,
      ),
      TweenSequenceItem(tween: ConstantTween(pi / 2), weight: 50.0)
    ]).animate(_controller);
  }

  static Animation<double> moveToFront(AnimationController _controller) {
    return TweenSequence([
      TweenSequenceItem(tween: ConstantTween(pi / 2), weight: 50.0),
      TweenSequenceItem(
          tween: Tween(begin: -pi / 2, end: 0.0).chain(
            CurveTween(curve: Curves.easeOutBack),
          ),
          weight: 50.0)
    ]).animate(_controller);
  }

  static AnimatedWidget getTransisi(
      context, animation, secondAnimation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
