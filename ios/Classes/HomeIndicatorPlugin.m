#import "HomeIndicatorPlugin.h"
#if __has_include(<home_indicator/home_indicator-Swift.h>)
#import <home_indicator/home_indicator-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "home_indicator-Swift.h"
#endif

@implementation HomeIndicatorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHomeIndicatorPlugin registerWithRegistrar:registrar];
}
@end
