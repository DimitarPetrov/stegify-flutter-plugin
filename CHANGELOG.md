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
