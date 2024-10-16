import 'package:day08_user_settings_coppy/models.dart';
import 'package:day08_user_settings_coppy/settings_preferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _usernameController = TextEditingController();
  var _selectedLanguage = <ProgrammingLanguage>{};
  var _selectedGender = Gender.FEMALE;
  var _isEmployed = false;
  final _prefs = SettingsPreferences();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _prefs.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _isEmployed = settings.isEmployed;
      _selectedLanguage = settings.languages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            RadioListTile(
                title: const Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    {setState(() => _selectedGender = newValue!)}),
            RadioListTile(
                title: const Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    {setState(() => _selectedGender = newValue!)}),
            RadioListTile(
                title: const Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    {setState(() => _selectedGender = newValue!)}),
            CheckboxListTile(
                title: const Text('Dart'),
                value: _selectedLanguage.contains(ProgrammingLanguage.DART),
                onChanged: (newValue) => {
                      setState(() => _selectedLanguage
                              .contains(ProgrammingLanguage.DART)
                          ? _selectedLanguage.remove(ProgrammingLanguage.DART)
                          : _selectedLanguage.add(ProgrammingLanguage.DART))
                    }),
            CheckboxListTile(
                title: const Text('JavaScript'),
                value:
                    _selectedLanguage.contains(ProgrammingLanguage.JAVASCRIPT),
                onChanged: (newValue) => {
                      setState(() => _selectedLanguage
                              .contains(ProgrammingLanguage.JAVASCRIPT)
                          ? _selectedLanguage
                              .remove(ProgrammingLanguage.JAVASCRIPT)
                          : _selectedLanguage
                              .add(ProgrammingLanguage.JAVASCRIPT))
                    }),
            CheckboxListTile(
                title: const Text('Kotlin'),
                value: _selectedLanguage.contains(ProgrammingLanguage.KOTLIN),
                onChanged: (newValue) => {
                      setState(() => _selectedLanguage
                              .contains(ProgrammingLanguage.KOTLIN)
                          ? _selectedLanguage.remove(ProgrammingLanguage.KOTLIN)
                          : _selectedLanguage.add(ProgrammingLanguage.KOTLIN))
                    }),
            CheckboxListTile(
                title: const Text('Swift'),
                value: _selectedLanguage.contains(ProgrammingLanguage.SWIFT),
                onChanged: (newValue) => {
                      setState(() => _selectedLanguage
                              .contains(ProgrammingLanguage.SWIFT)
                          ? _selectedLanguage.remove(ProgrammingLanguage.SWIFT)
                          : _selectedLanguage.add(ProgrammingLanguage.SWIFT))
                    }),
            SwitchListTile(
                title: const Text('isEmployed'),
                value: _isEmployed,
                onChanged: (newValue) =>
                    {setState(() => _isEmployed = newValue)}),
            TextButton(
                onPressed: _saveSettings, child: const Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final settings = Settings(_usernameController.text, _selectedGender,
        _isEmployed, _selectedLanguage);
    _prefs.saveSettings(settings);
  }
}
