import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


///
/// translate extension on string for translating
/// the string to multiple languages according to preference.
///


extension Localization on String{
  String get translate{
    return AppLocalization.getInstance.text(this)??'$this not found';
  }
}


///
/// Handle the app localization according to locale stored on the preferences
///

class AppLocalization {
  Locale? locale;
  static AppLocalization? _instance;
  late Map<String, String> _sentences;
  AppLocalization._();

  static AppLocalization get getInstance =>
      _instance = _instance ?? AppLocalization._();

  // ignore: use_setters_to_change_properties
  void setLocale(Locale locale) {
    this.locale = locale;
  }

  Future<bool> load() async {
    _sentences = <String, String>{};
    // parse common json data
    await _parseJson('${locale?.languageCode}.json');
    return true;
  }


  Future<void> _parseJson(String fileName) async {
    // reading json
    var data = await _loadAsset('locale/i18n_$fileName');
    if (data != null) {
      Map<String, dynamic> _result = json.decode(data);
      // adding values to [_sentences]
      _result.forEach((String key, dynamic value) {
        _sentences[key] = value.toString();
      });
    }
  }

  Future<String?> _loadAsset(String key) async {
    try {
      return await rootBundle.loadString(key);
    } on FlutterError catch (_) {
      return null;
    }
  }

  String? text(String key) {
    if (!_sentences.containsKey(key)) return '$key not found';
    return _sentences[key];
  }

}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{

  const AppLocalizationDelegate();

  static final _supportedLanguage = [
    'en',
    'ar'
  ];
  static const _supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static Locale _locale = Locale('ar');
  static List<Locale> get supportedLocales => _supportedLocales;
  static Locale get locale => _locale;

  @override
  bool isSupported(Locale locale) => _supportedLanguage.contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    var localizations = AppLocalization.getInstance;
    localizations.setLocale(locale);
    await localizations.load();
    _locale = locale;
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;

}