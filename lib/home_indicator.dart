import 'dart:async';

import 'package:flutter/services.dart';

/// Platform channel to show/hide the iPhone X home indicator
/// (the swipeable bar at the bottom of the screen).
class HomeIndicator {
  static const MethodChannel _channel =
      const MethodChannel('home_indicator');

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
}
