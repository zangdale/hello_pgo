import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_pgo/hello_pgo.dart';

void main() {
  const MethodChannel channel = MethodChannel('hello_pgo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await HelloPgo.platformVersion, '42');
  });
}
