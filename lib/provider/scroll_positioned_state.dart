import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollPositionedState with ChangeNotifier {
  final _scrollPositioned = ItemScrollController();

  ItemScrollController get getScrollPositioned => _scrollPositioned;

  toIndex() {
    var randomNumber = Random();
    _scrollPositioned.scrollTo(
        index: randomNumber.nextInt(350),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }
}
