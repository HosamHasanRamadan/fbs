#import "Flutter{{ service_name.pascalCase() }}BackgroundServicePlugin.h"
#if __has_include(<flutter_{{ service_name.snakeCase() }}_background_service_ios/flutter_{{ service_name.snakeCase() }}_background_service_ios-Swift.h>)
#import <flutter_{{ service_name.snakeCase() }}_background_service_ios/flutter_{{ service_name.snakeCase() }}_background_service_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_{{ service_name.snakeCase() }}_background_service_ios-Swift.h"
#endif

@interface GeneratedPluginRegistrant : NSObject
+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry;
@end


@implementation Flutter{{ service_name.pascalCase() }}BackgroundServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutter{{ service_name.pascalCase() }}BackgroundServicePlugin registerWithRegistrar:registrar];
}

+ (void)setPluginRegistrantCallback:(FlutterPluginRegistrantCallback)callback {
    [SwiftFlutter{{ service_name.pascalCase() }}BackgroundServicePlugin setPluginRegistrantCallback:callback];
}

+ (nullable Class)lookupGeneratedPluginRegistrant {
    NSString* classNameToCompare = @"GeneratedPluginRegistrant";
    return NSClassFromString(classNameToCompare);
}

+ (void)registerEngine:(FlutterEngine*)engine {
    [[Flutter{{ service_name.pascalCase() }}BackgroundServicePlugin lookupGeneratedPluginRegistrant] registerWithRegistry:engine];
}
@end
