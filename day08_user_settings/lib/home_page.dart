import 'package:day08_user_settings/models.dart';
import 'package:day08_user_settings/preferences_service.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLanguage = <ProgramingLanguage>{};
  var _isEmployed = false;
  final _prefs = PreferencesService();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
          ),
          RadioListTile(
              title: const Text('Female'),
              value: Gender.FEMALE,
              groupValue: _selectedGender,
              onChanged: (newValue) =>
                  setState(() => _selectedGender = newValue!)),
          RadioListTile(
              title: const Text('Male'),
              value: Gender.MALE,
              groupValue: _selectedGender,
              onChanged: (newValue) =>
                  setState(() => _selectedGender = newValue!)),
          RadioListTile(
              title: const Text('Other'),
              value: Gender.OTHER,
              groupValue: _selectedGender,
              onChanged: (newValue) =>
                  setState(() => _selectedGender = newValue!)),
          CheckboxListTile(
              title: const Text('Dart'),
              value: _selectedLanguage.contains(ProgramingLanguage.DART),
              onChanged: (newValue) => setState(() =>
                  _selectedLanguage.contains(ProgramingLanguage.DART)
                      ? _selectedLanguage.remove(ProgramingLanguage.DART)
                      : _selectedLanguage.add(ProgramingLanguage.DART))),
          CheckboxListTile(
              title: const Text('JavaScript'),
              value: _selectedLanguage.contains(ProgramingLanguage.JAVASCRIPT),
              onChanged: (newValue) => setState(() =>
                  _selectedLanguage.contains(ProgramingLanguage.JAVASCRIPT)
                      ? _selectedLanguage.remove(ProgramingLanguage.JAVASCRIPT)
                      : _selectedLanguage.add(ProgramingLanguage.JAVASCRIPT))),
          CheckboxListTile(
              title: const Text('Kotlin'),
              value: _selectedLanguage.contains(ProgramingLanguage.KOTLIN),
              onChanged: (newValue) => setState(() =>
                  _selectedLanguage.contains(ProgramingLanguage.KOTLIN)
                      ? _selectedLanguage.remove(ProgramingLanguage.KOTLIN)
                      : _selectedLanguage.add(ProgramingLanguage.KOTLIN))),
          CheckboxListTile(
              title: const Text('Swift'),
              value: _selectedLanguage.contains(ProgramingLanguage.SWIFT),
              onChanged: (newValue) => setState(() =>
                  _selectedLanguage.contains(ProgramingLanguage.SWIFT)
                      ? _selectedLanguage.remove(ProgramingLanguage.SWIFT)
                      : _selectedLanguage.add(ProgramingLanguage.SWIFT))),
          SwitchListTile(
              title: const Text('is Employed'),
              value: _isEmployed,
              onChanged: (newValue) => setState(() => _isEmployed = newValue)),
          TextButton(
              onPressed: _saveSettings, child: const Text('Save Settings'))
        ],
      ),
    );
  }

  void _saveSettings() {
    var settings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        programingLanguage: _selectedLanguage,
        isEmployed: _isEmployed);

    print(settings);

    _prefs.saveSettings(settings);
  }

  void _populateFields() async {
    final settings = await _prefs.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _isEmployed = settings.isEmployed;
      _selectedLanguage = settings.programingLanguage;
    });
  }
}
