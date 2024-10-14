import 'package:day08_user_settings/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', settings.username);
    prefs.setInt('gender', settings.gender.index);
    prefs.setBool('isEmployed', settings.isEmployed);
    prefs.setStringList('programingLanguage',
        settings.programingLanguage.map((e) => e.toString()).toList());

    print('Saved Settings');
  }

  Future<Settings> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') as String;
    final gender = Gender.values[prefs.getInt('gender') ?? 0];
    final isEmployed = prefs.getBool('isEmployed') as bool;
    final programmingLanguageIndices = prefs.getStringList('programingLanguage');

    final programingLanguage = programmingLanguageIndices?.map(
            (stringIndex) => ProgramingLanguage.values[int.parse(stringIndex)])
        .toSet();
    return Settings(
        username: username,
        gender: gender,
        programingLanguage: programingLanguage as Set<ProgramingLanguage>,
        isEmployed: isEmployed);
  }
}
