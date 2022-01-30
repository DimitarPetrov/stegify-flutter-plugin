## 0.0.1
`flutter-stegify` plugin offers an easy to use `Dart` functions for steganography encodin/decoding.
The original implementation is in `Go` and can be found here: [stegify](https://github.com/DimitarPetrov/stegify)

```dart
void encode(String carrierFileName, String dataFileName, String resultFileName) async
void decode(String carrierFileName, String resultFileName) async
``` 

`encode` performs steganography encoding of data file in carrier file and saves the steganography encoded product in new file.

`decode` performs steganography decoding of data previously encoded by the Encode function.
The data is decoded from file carrier and it is saved in separate new file

> **_NOTE:_**  When `encoding` the file extension of result file is inherited from the carrier file and must not be specified
explicitly in the `resultFileName` argument.

> **_NOTE:_**  When `decoding` the result file won't have any file extension and therefore it should be specified explicitly
in the `resultFileName` argument.

## 0.0.3
Fix gradle setup.

## 0.0.4

Make the API async.

## 0.0.5

#### Improve usage documentation
In order to import this plugin correctly you need to add the following lines to your **settings.gradle**:

In the beginning add: `include ':steg'`

In the end of the file add: `project(':steg').projectDir = new File(project(':flutter_stegify').projectDir, 'steg')`

Example usage of the plugin can be found [here](https://github.com/DimitarPetrov/stegify-mobile/blob/6b196690fa7f1db18eba387f49bec22f9a7de847/android/settings.gradle).

## 0.0.6

Increase Kotlin version to 1.3.10

## 0.1.0

Perform steganography encoding/decoding in a separate thread in order to avoid blocking UI thread.

## 0.1.1

Improve documentation with `Go` specific prerequisites.

## 0.2.0

- Supporting the new Android plugins APIs with V2 Embedding
- Simplify prerequisites. Prior this version fully function Go environment with gomobile and stegify installed was required. 
  This is not the case anymore as the needed packages are embedded in the plugin.