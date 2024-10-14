enum Gender { FEMALE, MALE, OTHER }

enum ProgramingLanguage { DART, JAVASCRIPT, KOTLIN, SWIFT }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgramingLanguage> programingLanguage;
  final bool isEmployed;

  Settings(
      {required this.username,
      required this.gender,
      required this.programingLanguage,
      required this.isEmployed});
}
