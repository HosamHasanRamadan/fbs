import 'dart:async';

import 'package:flutter_{{ service_name.snakeCase() }}_background_service_platform_interface/src/configs.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'src/configs.dart';

abstract class Observable {
  void invoke(String method, [Map<String, dynamic>? args]);
  Stream<Map<String, dynamic>?> on(String method);
}

abstract class Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform extends PlatformInterface
    implements Observable {
  Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform() : super(token: _token);
  static final Object _token = Object();

  static Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform? _instance;

  static Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform get instance {
    if (_instance == null) {
      throw 'FlutterBackgroundService is currently supported for Android and iOS Platform only.';
    }

    return _instance!;
  }

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterBackgroundServicePlatform] when they register themselves.
  static set instance(Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<bool> configure({
    required IosConfiguration iosConfiguration,
    required AndroidConfiguration androidConfiguration,
  });

  Future<bool> start();

  Future<bool> isServiceRunning();
}

abstract class {{ service_name.pascalCase() }}ServiceInstance implements Observable {
  /// Stop the service
  Future<void> stopSelf();
}
