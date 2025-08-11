
import 'flutter_intent_handler_platform_interface.dart';

class FlutterIntentHandler {
  Future<String?> getPlatformVersion() {
    return FlutterIntentHandlerPlatform.instance.getPlatformVersion();
  }
}
