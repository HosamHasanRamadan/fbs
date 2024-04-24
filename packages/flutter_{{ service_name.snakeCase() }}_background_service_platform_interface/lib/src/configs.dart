import 'dart:async';

import 'package:flutter_{{ service_name.snakeCase() }}_background_service_platform_interface/flutter_{{ service_name.snakeCase() }}_background_service_platform_interface.dart';

class IosConfiguration {
  /// must be a top level or static method
  /// this method will be executed when app is in foreground
  final Function({{ service_name.pascalCase() }}ServiceInstance service)? onForeground;

  /// must be a top level or static method
  /// this method will be executed by background fetch
  /// make sure you don't execute long running task there because of limitations on ios
  /// recommended maximum executed duration is only 15-20 seconds.
  final FutureOr<bool> Function({{ service_name.pascalCase() }}ServiceInstance service)? onBackground;

  /// whether service auto start after configure.
  final bool autoStart;

  IosConfiguration({
    this.onForeground,
    this.onBackground,
    this.autoStart = true,
  });
}

class AndroidConfiguration {
  /// must be a top level or static method
  final Function({{ service_name.pascalCase() }}ServiceInstance service) onStart;

  /// whether service can start automatically after configure
  final bool autoStart;

  /// wheter service can start automatically on boot
  final bool autoStartOnBoot;

  /// whether service is foreground or background mode
  final bool isForegroundMode;

  /// notification content that will be shown on status bar when the background service is starting
  /// defaults to "Preparing"
  final String initialNotificationContent;
  final String initialNotificationTitle;

  /// use custom notification channel id
  /// you must to create the notification channel before you run configure() method.
  final String? notificationChannelId;

  /// notification id will be used by foreground service
  final int foregroundServiceNotificationId;

  AndroidConfiguration({
    required this.onStart,
    this.autoStart = true,
    this.autoStartOnBoot = true,
    required this.isForegroundMode,
    this.initialNotificationContent = 'Preparing',
    this.initialNotificationTitle = 'Background Service',
    this.notificationChannelId,
    this.foregroundServiceNotificationId = 112233,
  });
}
