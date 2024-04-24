library flutter_{{ service_name.snakeCase() }}_background_service;

import 'dart:async';

import 'package:flutter_{{ service_name.snakeCase() }}_background_service_platform_interface/flutter_{{ service_name.snakeCase() }}_background_service_platform_interface.dart';

export 'package:flutter_{{ service_name.snakeCase() }}_background_service_platform_interface/flutter_{{ service_name.snakeCase() }}_background_service_platform_interface.dart'
    show IosConfiguration, AndroidConfiguration, {{ service_name.pascalCase() }}ServiceInstance;

class Flutter{{ service_name.pascalCase() }}BackgroundService implements Observable {
  Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform get _platform =>
      Flutter{{ service_name.pascalCase() }}BackgroundServicePlatform.instance;

  /// configure the background service handler
  /// it's highly recommended to call this method in main() method
  Future<bool> configure({
    required IosConfiguration iosConfiguration,
    required AndroidConfiguration androidConfiguration,
  }) =>
      _platform.configure(
        iosConfiguration: iosConfiguration,
        androidConfiguration: androidConfiguration,
      );

  static Flutter{{ service_name.pascalCase() }}BackgroundService _instance =
      Flutter{{ service_name.pascalCase() }}BackgroundService._internal();

  Flutter{{ service_name.pascalCase() }}BackgroundService._internal();

  factory Flutter{{ service_name.pascalCase() }}BackgroundService() => _instance;

  /// Starts the background service.
  Future<bool> startService() => _platform.start();

  /// Whether the service is running
  Future<bool> isRunning() => _platform.isServiceRunning();

  @override
  void invoke(String method, [Map<String, dynamic>? arg]) =>
      _platform.invoke(method, arg);

  @override
  Stream<Map<String, dynamic>?> on(String method) => _platform.on(method);
}
