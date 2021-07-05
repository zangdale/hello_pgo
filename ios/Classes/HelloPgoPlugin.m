#import "HelloPgoPlugin.h"
#if __has_include(<hello_pgo/hello_pgo-Swift.h>)
#import <hello_pgo/hello_pgo-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hello_pgo-Swift.h"
#endif

@implementation HelloPgoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHelloPgoPlugin registerWithRegistrar:registrar];
}
@end
