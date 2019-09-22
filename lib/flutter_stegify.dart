import 'package:flutter/services.dart';

class FlutterStegify {
  static const MethodChannel _channel = const MethodChannel('flutter_stegify');

  static void encode(String carrier, String data, String result) async {
    await _channel.invokeMethod("encode", [carrier, data, result]);
  }

  static void decode(String carrier, String result) async {
    await _channel.invokeMethod("decode", [carrier, result]);
  }
}
