import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_intent_handler/flutter_intent_handler.dart';
import 'package:flutter_intent_handler/flutter_intent_handler_platform_interface.dart';
import 'package:flutter_intent_handler/flutter_intent_handler_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIntentHandlerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIntentHandlerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIntentHandlerPlatform initialPlatform = FlutterIntentHandlerPlatform.instance;

  test('$MethodChannelFlutterIntentHandler is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIntentHandler>());
  });

  test('getPlatformVersion', () async {
    FlutterIntentHandler flutterIntentHandlerPlugin = FlutterIntentHandler();
    MockFlutterIntentHandlerPlatform fakePlatform = MockFlutterIntentHandlerPlatform();
    FlutterIntentHandlerPlatform.instance = fakePlatform;

    expect(await flutterIntentHandlerPlugin.getPlatformVersion(), '42');
  });
}
