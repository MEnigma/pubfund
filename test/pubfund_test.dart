import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pubfund/pubfund.dart';

void main() {
  const MethodChannel channel = MethodChannel('pubfund');

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
    expect(await Pubfund.platformVersion, '42');
  });
}
