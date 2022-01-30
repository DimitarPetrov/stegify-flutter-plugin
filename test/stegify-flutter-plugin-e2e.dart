import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_stegify/flutter_stegify.dart';
import 'package:e2e/e2e.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Encode works', (WidgetTester tester) async {
    final Stegify stegify = Stegify();
  });
}