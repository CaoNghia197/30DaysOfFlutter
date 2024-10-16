enum Gender { FEMALE, MALE, OTHER }

enum ProgrammingLanguage { DART, JAVASCRIPT, KOTLIN, SWIFT }

class Settings {
  final String username;
  final Gender gender;
  final bool isEmployed;
  final Set<ProgrammingLanguage> languages;

  Settings(this.username, this.gender, this.isEmployed, this.languages);

  @override
  String toString() {
    return 'Settings {'
        '\n Username : $username'
        '\n Gender : $gender'
        '\n IsEmployed : $isEmployed'
        '\n ProgrammingLanguage : $languages'
        '}';
  }
}
