
import 'device_model_make_plugin_platform_interface.dart';

class DeviceModelMakePlugin {
  Future<String?> getPlatformVersion() {
    return DeviceModelMakePluginPlatform.instance.getPlatformVersion();
  }
}
