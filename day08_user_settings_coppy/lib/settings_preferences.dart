import 'package:day08_user_settings_coppy/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences {
  Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', settings.username);
    prefs.setInt('gender', settings.gender.index);
    prefs.setBool('is_employed', settings.isEmployed);

    prefs.setStringList(
        'languages',
        settings.languages
            .map((language) => language.index.toString())
            .toList());

    print('Save settings success');
  }

  Future<Settings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('user_name') as String;
    final gender = Gender.values[prefs.getInt('gender') ?? 0];
    final isEmployed = prefs.getBool('is_employed') as bool;
    final languages = prefs.getStringList('languages');
    final programmingLanguage = languages
        ?.map((e) => ProgrammingLanguage.values[int.parse(e)])
        .toSet() as Set<ProgrammingLanguage>;
    return Settings(username, gender, isEmployed, programmingLanguage);
  }
}
