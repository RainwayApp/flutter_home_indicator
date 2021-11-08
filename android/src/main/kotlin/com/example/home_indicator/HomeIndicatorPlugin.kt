package com.example.home_indicator

import HomeIndicatorMethodCallHandler

import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin

class HomeIndicatorPlugin: FlutterPlugin {
  private var channel: MethodChannel? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "home_indicator")
    channel?.setMethodCallHandler(HomeIndicatorMethodCallHandler())
  }

  override fun onDetachedFromEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null;
  }
}
