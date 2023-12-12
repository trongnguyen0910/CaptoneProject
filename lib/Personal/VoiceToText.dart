import 'package:flutter/material.dart';
import 'package:myapp/Personal/voice_to_text_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Consumer<VoiceToTextProvider>(
          builder: (context, provider, _) {
            return Switch(
              value: provider.isVoiceToTextEnabled,
              onChanged: (value) {
                provider.setVoiceToTextEnabled(value);
              },
            );
          },
        ),
      ),
    );
  }
}
