import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AmplitudeService {
  final String apiKey = dotenv.env['AMPLITUDE_API_KEY'] ?? 'default_value';

  AmplitudeService() {
    Amplitude.getInstance().init(dotenv.env['AMPLITUDE_API_KEY'] ?? 'default');
  }

  void logEvent(String eventName) {
    Amplitude.getInstance().logEvent(eventName);
  }
}
