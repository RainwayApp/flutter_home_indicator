import Flutter
import UIKit

class HomeIndicatorAwareFlutterViewController : FlutterViewController {
  static var hidingHomeIndicator: Bool = false

#if os(iOS)
  #if swift(>=4.2)
  @available(iOS 11.0, *)
  override var prefersHomeIndicatorAutoHidden: Bool {
    return HomeIndicatorAwareFlutterViewController.hidingHomeIndicator
  }
  #else
  @available(iOS 11.0, *)
  override func prefersHomeIndicatorAutoHidden() -> Bool {
    return HomeIndicatorAwareFlutterViewController.hidingHomeIndicator
  }
  #endif
#endif

  func setHidingHomeIndicator(newValue: Bool) {
#if os(iOS)
    if (newValue != HomeIndicatorAwareFlutterViewController.hidingHomeIndicator) {
      HomeIndicatorAwareFlutterViewController.hidingHomeIndicator = newValue
      if #available(iOS 11.0, *) {
        if responds(to: #selector(setNeedsUpdateOfHomeIndicatorAutoHidden)) {
          setNeedsUpdateOfHomeIndicatorAutoHidden()
        }
      } else {
        // Fallback on earlier versions: do nothing
      }
    }
#endif
  }

  static var deferredEdges: UIRectEdge = []

#if os(iOS)
  #if swift(>=4.2)
  @available(iOS 11.0, *)
  override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
    return HomeIndicatorAwareFlutterViewController.deferredEdges
  }
  #else
  @available(iOS 11.0, *)
  override func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge {
    return HomeIndicatorAwareFlutterViewController.deferredEdges
  }
  #endif
#endif

  func setDeferredEdges(newValue: UIRectEdge) {
#if os(iOS)
    if (newValue != HomeIndicatorAwareFlutterViewController.deferredEdges) {
      HomeIndicatorAwareFlutterViewController.deferredEdges = newValue
      if #available(iOS 11.0, *) {
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
      } else {
        // Fallback on earlier versions: do nothing
      }
    }
#endif
  }
}

public class SwiftHomeIndicatorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "home_indicator", binaryMessenger: registrar.messenger())
    let instance = SwiftHomeIndicatorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  private func controller() -> HomeIndicatorAwareFlutterViewController? {
    guard let window = UIApplication.shared.keyWindow else { print("no window"); return nil }
    guard let rvc = window.rootViewController else { print("no rvc"); return nil }
    if let rvc = rvc as? HomeIndicatorAwareFlutterViewController { return rvc }
    guard let fvc = rvc as? FlutterViewController else { return nil }
    object_setClass(fvc, HomeIndicatorAwareFlutterViewController.self)
    let newController = fvc as! HomeIndicatorAwareFlutterViewController
    window.rootViewController = newController as UIViewController?
    return newController
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let noController = FlutterError(code: "NO_CONTROLLER", message: "Error fetching HomeIndicatorAwareFlutterViewController", details: nil);
    let noArgument = FlutterError(code: "NO_ARGUMENT", message: "Expected an argument to \(call.method) but didn't get any", details: nil);
    let argumentError = FlutterError(code: "ARGUMENT_ERROR", message: "Argument to \(call.method) has the wrong type", details: nil);
    if (call.method == "hide") {
      guard let controller = controller() else { result(noController); return }
      controller.setHidingHomeIndicator(newValue: true)
      result(nil)
    } else if (call.method == "show") {
      guard let controller = controller() else { result(noController); return }
      controller.setHidingHomeIndicator(newValue: false)
      result(nil)
    } else if (call.method == "isHidden") {
      result(HomeIndicatorAwareFlutterViewController.hidingHomeIndicator)
    } else if (call.method == "deferScreenEdges") {
      guard let controller = controller() else { result(noController); return }
      guard let arg = call.arguments else { result(noArgument); return }
      guard let num = arg as? UInt else { result(argumentError); return }
      controller.setDeferredEdges(newValue: UIRectEdge(rawValue: num))
      result(nil)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
