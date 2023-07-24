import 'package:flutter_test/flutter_test.dart';
import 'package:device_model_make_plugin/device_model_make_plugin.dart';
import 'package:device_model_make_plugin/device_model_make_plugin_platform_interface.dart';
import 'package:device_model_make_plugin/device_model_make_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceModelMakePluginPlatform
    with MockPlatformInterfaceMixin
    implements DeviceModelMakePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceModelMakePluginPlatform initialPlatform = DeviceModelMakePluginPlatform.instance;

  test('$MethodChannelDeviceModelMakePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceModelMakePlugin>());
  });

  test('getPlatformVersion', () async {
    DeviceModelMakePlugin deviceModelMakePlugin = DeviceModelMakePlugin();
    MockDeviceModelMakePluginPlatform fakePlatform = MockDeviceModelMakePluginPlatform();
    DeviceModelMakePluginPlatform.instance = fakePlatform as MethodChannelDeviceModelMakePlugin;

    expect(await deviceModelMakePlugin.getPlatformVersion(), '42');
  });
}
