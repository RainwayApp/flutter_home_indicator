#import "HomeIndicatorPlugin.h"
#import <home_indicator-Swift.h>

@implementation HomeIndicatorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHomeIndicatorPlugin registerWithRegistrar:registrar];
}
@end
