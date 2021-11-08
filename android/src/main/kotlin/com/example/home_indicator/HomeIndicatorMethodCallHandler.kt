package com.example.home_indicator

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class HomeIndicatorMethodCallHandler: MethodCallHandler {
  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "show" -> result.success(null)
      "hide" -> result.success(null)
      "isHidden" -> result.success(null)
      "deferScreenEdges" -> result.success(null)
      else -> result.notImplemented()
    }
  }
}
