import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_intent_handler_method_channel.dart';

abstract class FlutterIntentHandlerPlatform extends PlatformInterface {
  /// Constructs a FlutterIntentHandlerPlatform.
  FlutterIntentHandlerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIntentHandlerPlatform _instance = MethodChannelFlutterIntentHandler();

  /// The default instance of [FlutterIntentHandlerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIntentHandler].
  static FlutterIntentHandlerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIntentHandlerPlatform] when
  /// they register themselves.
  static set instance(FlutterIntentHandlerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
