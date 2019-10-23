package com.example.home_indicator

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class HomeIndicatorPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "home_indicator")
      channel.setMethodCallHandler(HomeIndicatorPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "show") {
      result.success(null)
    } else if (call.method == "hide") {
      result.success(null)
    } else if (call.method == "isHidden") {
      result.success(true)
    } else {
      result.notImplemented()
    }
  }
}
