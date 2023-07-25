import Flutter
import UIKit

public class DeviceModelMakePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name:  "hassanmirza444.github.com/deviceModelMakePlugin", binaryMessenger: registrar.messenger())
    let instance = DeviceModelMakePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceModelMake":
                let deviceversion = UIDevice.current.systemVersion
                let modelName = UIDevice.current.model
                let osName = UIDevice.current.systemName
            let modelMake = "Model : \(modelName)\nOS : \(osName)\nVersion : \(deviceversion)"

      result(modelMake)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
