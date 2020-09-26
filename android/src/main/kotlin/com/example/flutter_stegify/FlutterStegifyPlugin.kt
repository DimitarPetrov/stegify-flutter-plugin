package com.example.flutter_stegify

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import steg.Steg
import kotlin.concurrent.thread

/** FlutterStegifyPlugin  */
class FlutterStegifyPlugin : MethodCallHandler {

    private inline fun <reified T> readArgument(args: List<*>, index: Int): T {
        if (index < args.size) {
            val argument = args[index]
            if (argument is T) {
                return argument
            } else {
                throw IllegalArgumentException("Argument at index $index " +
                        "has unexpected type: ${argument?.javaClass?.name}")
            }
        }
        throw IllegalArgumentException("No argument available at index $index")
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "encode") {
            val args = call.arguments
            if (args is List<*>) {
                if (args.size == 3) {
                    thread() {
                        try {
                            val first = readArgument<String>(args, 0)
                            val second = readArgument<String>(args, 1)
                            val third = readArgument<String>(args, 2)
                            Steg.encodeByFileNames(first, second, third)
                            Handler(Looper.getMainLooper()).post {
                                result.success(null)
                            }
                        } catch (e: IllegalArgumentException) {
                            Handler(Looper.getMainLooper()).post {
                                result.error("BAD_ARGS", e.message!!, null)
                            }
                        } catch (e: Exception) {
                            Handler(Looper.getMainLooper()).post {
                                result.error("NATIVE_ERR", e.message!!, null)
                            }
                        }
                    }
                } else {
                    result.error("BAD_ARGS",
                            "Wrong arg count (encode expects 3 args): ${args.size}", null)
                }
            } else {
                result.error("BAD_ARGS", "Wrong argument types", null)
            }
        } else if (call.method == "decode") {
            val args = call.arguments
            if (args is List<*>) {
                if (args.size == 2) {
                    thread() {
                        try {
                            val first = readArgument<String>(args, 0)
                            val second = readArgument<String>(args, 1)
                            Steg.decodeByFileNames(first, second)
                            Handler(Looper.getMainLooper()).post {
                                result.success(null)
                            }
                        } catch (e: IllegalArgumentException) {
                            Handler(Looper.getMainLooper()).post {
                                result.error("BAD_ARGS", e.message!!, null)
                            }
                        } catch (e: Exception) {
                            Handler(Looper.getMainLooper()).post {
                                result.error("NATIVE_ERR", e.message!!, null)
                            }
                        }
                    }
                } else {
                    result.error("BAD_ARGS",
                            "Wrong arg count (decode expects 2 args): ${args.size}", null)
                }
            } else {
                result.error("BAD_ARGS", "Wrong argument types", null)
            }
        } else {
            result.notImplemented()
        }
    }

    companion object {
        /** Plugin registration.  */

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_stegify")
            channel.setMethodCallHandler(FlutterStegifyPlugin())
        }
    }
}
