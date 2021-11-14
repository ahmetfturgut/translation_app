class Translations {
  static final languages = <String>[
    'Türkçe',
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Russian'
  ];

  static String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Italian':
        return 'it';
      case 'Russian':
        return 'ru';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      case 'Türkçe':
        return 'tr';
      default:
        return 'en';
    }
  }

  static String getLanguageName(String language) {
    switch (language) {
      case 'en':
        return 'English';
      case 'fr':
        return 'French';
      case 'it':
        return 'Italian';
      case 'ru':
        return 'Russian';
      case 'es':
        return 'Spanish';
      case 'de':
        return 'German';
      case 'tr':
        return 'Türkçe';
      default:
        return 'Türkçe';
    }
  }
}
