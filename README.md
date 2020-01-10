# stegify-flutter-plugin

Flutter plugin for fully transparent hiding any file within an image using [stegify](https://github.com/DimitarPetrov/stegify) API. 
This technique is known as LSB (Least Significant Bit) [steganography](https://en.wikipedia.org/wiki/steganography)

## Demonstration

| Carrier                                | Data                                | Result                                               |
| ---------------------------------------| ------------------------------------|------------------------------------------------------|
| ![Original File](https://github.com/DimitarPetrov/stegify/blob/master/examples/street.jpeg) | ![Encoded File](https://github.com/DimitarPetrov/stegify/blob/master/examples/lake.jpeg) | ![Encoded File](https://github.com/DimitarPetrov/stegify/blob/master/examples/test_decode.jpeg) |

The `Result` file contains the `Data` file hidden in it. And as you can see it is fully transparent.

# Usage
[flutter-stegify](https://pub.dev/packages/flutter_stegify) plugin offers an easy to use `Dart` functions for steganography encodin/decoding.
The original implementation is in `Go` and can be found here: [stegify](https://github.com/DimitarPetrov/stegify)

This plugin uses [go-mobile](https://github.com/golang/mobile) for generating platform native bindings
and exposes `Dart` functions which can be used directly in your flutter mobile application!

In order to import this plugin correctly you need to add the following lines to your **settings.gradle**:

In the beginning add: `include ':steg'`

In the end of the file add: `project(':steg').projectDir = new File(project(':flutter_stegify').projectDir, 'steg')`

Example usage of the plugin can be found [here](https://github.com/DimitarPetrov/stegify-mobile/blob/6b196690fa7f1db18eba387f49bec22f9a7de847/android/settings.gradle).

## API

```dart
void encode(String carrierFileName, String dataFileName, String resultFileName) async
void decode(String carrierFileName, String resultFileName) async
``` 

`encode` performs steganography encoding of data file in carrier file and saves the steganography encoded product in new file.

`decode` performs steganography decoding of data previously encoded by the Encode function.
The data is decoded from file carrier and it is saved in separate new file

> **_NOTE:_**  The result file won't have any file extension and therefore it should be specified explicitly
in the `resultFileName` argument.

## Disclaimer

If carrier file is in jpeg or jpg format, after encoding the result file image will be png encoded (therefore it may be bigger in size)
despite of file extension inherited from the original carrier file (which is .jpeg or .jpg).
