import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _voiceToTextEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Voice-to-Text'),
            Switch(
              value: _voiceToTextEnabled,
              onChanged: (value) async {
                // Save the setting to SharedPreferences
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('voiceToTextEnabled', value);

                setState(() {
                  _voiceToTextEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
