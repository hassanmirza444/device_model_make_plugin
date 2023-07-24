import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_model_make_plugin_method_channel.dart';

abstract class DeviceModelMakePluginPlatform extends PlatformInterface {

  DeviceModelMakePluginPlatform() : super(token: _token);
  static final Object _token = Object();



  static MethodChannelDeviceModelMakePlugin _instance = MethodChannelDeviceModelMakePlugin();
  static MethodChannelDeviceModelMakePlugin get instance => _instance;
  static set instance(MethodChannelDeviceModelMakePlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() async {
    final version = await _instance.getPlatformVersion();
    return version;
  }
}
