package com.hssnmirza.device_model_make_plugin

import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** DeviceModelMakePlugin */
class DeviceModelMakePlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "hassanmirza444.github.com/deviceModelMakePlugin"
        )
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getDeviceModelMake") {
            val makeModel = getDeviceModelMake()
            result.success(makeModel)
        } else {
            result.notImplemented()
        }
    }

    private fun getDeviceModelMake(): String {
        val model = Build.MODEL
        val sdkVersion = Build.VERSION.SDK_INT
        val os = "Android"
        return "Model : $model  \nOS : $os \nVersion : $sdkVersion"
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
