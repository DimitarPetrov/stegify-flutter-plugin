package io.flutter.plugins.batteryexample

import android.os.Bundle
import com.example.flutter_stegify.FlutterStegifyPlugin
import io.flutter.app.FlutterActivity
import io.flutter.plugins.pathprovider.PathProviderPlugin

// BACKWARDS_COMPATIBILITY: This tests the V1 Embedding backwards compatibility of the plugin.
class EmbeddingV1Activity : FlutterActivity() {
    protected override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        FlutterStegifyPlugin.registerWith(registrarFor("com.example.flutter_stegify.FlutterStegifyPlugin"))
        PathProviderPlugin.registerWith(registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"))
    }
}