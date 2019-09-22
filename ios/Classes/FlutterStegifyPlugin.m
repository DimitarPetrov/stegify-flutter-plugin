#import "FlutterStegifyPlugin.h"
#import <flutter_stegify/flutter_stegify-Swift.h>

@implementation FlutterStegifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterStegifyPlugin registerWithRegistrar:registrar];
}
@end
