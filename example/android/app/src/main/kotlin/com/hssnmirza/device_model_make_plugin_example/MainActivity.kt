package com.hssnmirza.device_model_make_plugin_example

import android.os.Build
import androidx.annotation.NonNull
import com.hssnmirza.device_model_make_plugin.DeviceModelMakePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "hassanmirza444.github.com/deviceModelMakePlugin"
    private val deviceModelMakePlugin: DeviceModelMakePlugin =DeviceModelMakePlugin();
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getDeviceModelMake") {
                 deviceModelMakePlugin.onMethodCall(call,result);
                val _deviceModelMake = ""
                if (_deviceModelMake.isNotEmpty()) {
                    result.success(_deviceModelMake)
                } else {
                    result.error("UNAVAILABLE", "Unable to get device Model and Make", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceModelMake(): String {
        val model = Build.MODEL
        val sdkVersion = Build.VERSION.SDK_INT
        val os = "Android"
        return "Model : $model  \nOS : $os \nVersion : $sdkVersion"
    }
}
