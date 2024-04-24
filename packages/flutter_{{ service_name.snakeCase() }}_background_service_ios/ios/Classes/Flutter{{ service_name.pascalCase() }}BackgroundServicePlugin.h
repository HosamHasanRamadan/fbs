#import <Flutter/Flutter.h>

@interface Flutter{{ service_name.pascalCase() }}BackgroundServicePlugin : NSObject<FlutterPlugin>
+ (void)registerEngine:(FlutterEngine*)engine;
@end
