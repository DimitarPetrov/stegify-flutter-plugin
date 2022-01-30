flutter build apk
cd android || exit
./gradlew app:connectedAndroidTest -Ptarget="$(pwd)"/../../test/stegify-flutter-plugin-e2e.dart
cd ..