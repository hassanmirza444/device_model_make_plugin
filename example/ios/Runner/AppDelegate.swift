import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "hassanmirza444.github.com/deviceModelMakePlugin",
                              binaryMessenger: controller.binaryMessenger)

              batteryChannel.setMethodCallHandler({
              [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in

                 
              // Note: this method is invoked on the UI thread.
              guard call.method == "getDeviceModelMake" else {
               result(FlutterMethodNotImplemented)
               return
              }
            self?.receiveBatteryLevel(result: result)
          })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    

  private func receiveBatteryLevel(result: FlutterResult) {
      
      
       let deviceversion = UIDevice.current.systemVersion
       let modelName = UIDevice.current.model
       let osName = UIDevice.current.systemName
     
      let modelMake = "Model : \(modelName)\nOS : \(osName)\nVersion : \(deviceversion)"
      result(modelMake)

  }
}
