import 'dart:async';

import 'package:flutter/services.dart';

/// An edge of the device screen.
enum ScreenEdge {
  top,
  left,
  bottom,
  right,
}

/// Platform channel to show/hide the iPhone X home indicator
/// (the swipeable bar at the bottom of the screen).
class HomeIndicator {
  static const MethodChannel _channel = const MethodChannel('home_indicator');

  /// Ask iOS to hide the iPhone X home indicator (bar at bottom of screen).
  /// Note: it will still show up when the user gestures near the bottom of the screen.
  static Future<void> hide() async {
    await _channel.invokeMethod('hide');
  }

  /// Ask iOS to show the iPhone X home indicator (bar at bottom of screen).
  /// It will then always be visible, as is the default setting.
  static Future<void> show() async {
    await _channel.invokeMethod('show');
  }

  /// Query whether the home indicator is currently instructed to be hidden.
  static Future<bool> isHidden() async {
    return await _channel.invokeMethod('isHidden');
  }

  /// Ask iOS to defer system gestures on the given edges of the screen.
  ///
  /// **Warning:** It appears "deferring" the bottom screen edge does _not_ successfully
  /// prevent a "home swipe" when the home indicator is also hidden. That is: if you need
  /// the behavior of `HomeIndicator.deferScreenEdges([ScreenEdge.bottom])`, then
  /// don't also call `HomeIndicator.hide()`.
  static Future<void> deferScreenEdges(List<ScreenEdge> edges) async {
    var mask = 0;
    for (final e in edges) {
      mask |= 1 << e.index;
    }
    await _channel.invokeMethod('deferScreenEdges', mask);
  }
}
