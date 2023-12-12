import 'package:flutter/foundation.dart';

class VoiceToTextProvider extends ChangeNotifier {
  bool _isVoiceToTextEnabled = false;

  bool get isVoiceToTextEnabled => _isVoiceToTextEnabled;

  void setVoiceToTextEnabled(bool value) {
    _isVoiceToTextEnabled = value;
    notifyListeners();
  }
}
