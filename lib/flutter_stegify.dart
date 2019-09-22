import 'package:flutter/services.dart';

class Stegify {
  static const MethodChannel _channel = const MethodChannel('flutter_stegify');

  // encode performs steganography encoding of data file in carrier file and saves the steganography encoded product in new file.
  static void encode(String carrier, String data, String result) async {
    await _channel.invokeMethod("encode", [carrier, data, result]);
  }

  // decode performs steganography decoding of data previously encoded by the Encode function.
  // The data is decoded from file carrier and it is saved in separate new file
  static void decode(String carrier, String result) async {
    await _channel.invokeMethod("decode", [carrier, result]);
  }
}
