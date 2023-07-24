import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_model_make_plugin_platform_interface.dart';

/// An implementation of [DeviceModelMakePluginPlatform] that uses method channels.
class MethodChannelDeviceModelMakePlugin extends DeviceModelMakePluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('hassanmirza444.github.com/deviceModelMakePlugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getDeviceModelMake');
    return version;
  }
}
