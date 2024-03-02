import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'cxui5zra': {
      'es': 'Logout',
      'en': 'Logout',
    },
    'uwlyo6g5': {
      'es': 'User data decoded base64',
      'en': 'User data decoded base64',
    },
    '7tfswgn3': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // HomePageCopy
  {
    'bs31endn': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    '5yiwd0qk': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // auth-forgotpassword
  {
    'vajfcnli': {
      'es': 'Contraseña olvidada',
      'en': 'Forgotten password',
    },
    'xod59m8a': {
      'es': 'Plataforma de transcripciónes con Inteligencia Artificial.',
      'en': 'Transcription platform with Artificial Intelligence.',
    },
    'd0rr2yfd': {
      'es': 'Correo...',
      'en': 'Mail...',
    },
    'sg6on21f': {
      'es': 'Enviar',
      'en': 'Send',
    },
    'npkygmp1': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'pa3c6anr': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'te0b3j5m': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    '2obeirgt': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'no0rgg51': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'm768ht5q': {
      'es': 'El password debe ser de mas de 6 caracteres',
      'en': 'The password must be more than 6 characters',
    },
    'w18w12tq': {
      'es': 'el password debe ser menor a 8 caracteres',
      'en': 'The password must be less than 8 characters',
    },
    '175yme0y': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'carqlfeo': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // auth-login
  {
    'hsn0akep': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    '9q3pyfa1': {
      'es': 'Plataforma de transcripciónes con Inteligencia Artificial.',
      'en': 'Transcription platform with Artificial Intelligence.',
    },
    'toyw2dii': {
      'es': 'Correo',
      'en': 'Mail',
    },
    '934jg1bu': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'io3epr24': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'ikzu05rx': {
      'es': 'No tienes una cuenta? ',
      'en': 'You do not have an account?',
    },
    'ffks7vm9': {
      'es': '   Registrate aqui',
      'en': 'Sign up here',
    },
    'kjujmrwf': {
      'es': 'Olvidaste tu contraseña? ',
      'en': 'Did you forget your password?',
    },
    'o8eqvn76': {
      'es': '  Recuperar contraseña',
      'en': 'Recover password',
    },
    'qkrbtcr1': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'ddkgupnq': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '6n4r5cwm': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    '6maruu5k': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'agg1oi3r': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // authregister
  {
    'u761ntlx': {
      'es': 'Registrarme',
      'en': 'Register',
    },
    '5gfeufvm': {
      'es': 'Plataforma de transcripciónes con Inteligencia Artificial.',
      'en': 'Transcription platform with Artificial Intelligence.',
    },
    'yuauztyz': {
      'es': 'Username',
      'en': 'Username',
    },
    '4vd3fqmh': {
      'es': 'Correo',
      'en': 'Mail',
    },
    '870y8ar9': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '09ygcrml': {
      'es': 'Registrarme',
      'en': 'Register',
    },
    'h476grnv': {
      'es': 'Ya tienes una cuenta?  ',
      'en': 'Do you already have an account?',
    },
    '08jovqvw': {
      'es': '  Igresa aqui',
      'en': 'Go here',
    },
    '3oi2sdku': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'ofav88ab': {
      'es': 'El correo debe pertenecer a la empresa',
      'en': 'The email must belong to the company',
    },
    'mwntki2u': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'o8mbmn4a': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'u1u3o9vy': {
      'es': 'El correo electronico debe ser del grupo.',
      'en': 'The email must be from the group.',
    },
    'wn6n8n4n': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    '0vk13bor': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    '31qnvq5w': {
      'es': 'El password debe ser de mas de 6 caracteres',
      'en': 'The password must be more than 6 characters',
    },
    '4m4vn0xy': {
      'es': 'el password debe ser menor a 8 caracteres',
      'en': 'The password must be less than 8 characters',
    },
    'mttqexd6': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'afp96wzn': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // resetPassword
  {
    'ddoqtmfv': {
      'es': 'Restablecer contraseña',
      'en': 'Restore password',
    },
    'ivwzhq6g': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña. Introduzca a continuación el correo electrónico asociado a su cuenta.',
      'en':
          'We will send you an email with a link to reset your password. Enter the email associated with your account below.',
    },
    'w7cu96rj': {
      'es': 'Contraseña...',
      'en': 'Password...',
    },
    'u0oyz956': {
      'es': 'Confirmar contraseña...',
      'en': 'Confirm Password...',
    },
    'eu93yspk': {
      'es': 'Enviar',
      'en': 'Send',
    },
    'kgbhkqf7': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'j0ni4ecd': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    '9g4bjxb2': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'prjnjv8p': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    '0ycdgim1': {
      'es': 'El campo es requerido',
      'en': 'The field is required',
    },
    'b7qjau71': {
      'es': 'El password debe ser de mas de 6 caracteres',
      'en': 'The password must be more than 6 characters',
    },
    'j26irm9d': {
      'es': 'el password debe ser menor a 8 caracteres',
      'en': 'The password must be less than 8 characters',
    },
    'c9q5fj61': {
      'es': 'Selecciona una opcion de la lista',
      'en': 'Select an option from the list',
    },
    'jrz07r5c': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // EmailRegisterMessage
  {
    '1mh3b2hg': {
      'es': '4m ago',
      'en': '4m ago',
    },
  },
  // Miscellaneous
  {
    '23r66tk1': {
      'es': '',
      'en': '',
    },
    'gv5k9ex3': {
      'es': '',
      'en': '',
    },
    'ep6rudke': {
      'es': '',
      'en': '',
    },
    '5ff1h7yq': {
      'es': '',
      'en': '',
    },
    'onw8g9ad': {
      'es': '',
      'en': '',
    },
    'gq0s0wjb': {
      'es': '',
      'en': '',
    },
    '7r7ro83q': {
      'es': '',
      'en': '',
    },
    'ywyhg4xr': {
      'es': '',
      'en': '',
    },
    'ctebjd87': {
      'es': '',
      'en': '',
    },
    'g7przl0t': {
      'es': '',
      'en': '',
    },
    'n1gsl4n4': {
      'es': '',
      'en': '',
    },
    't9gqjt4c': {
      'es': '',
      'en': '',
    },
    'ja0ncofy': {
      'es': '',
      'en': '',
    },
    'shbs0adl': {
      'es': '',
      'en': '',
    },
    'rxaqnbri': {
      'es': '',
      'en': '',
    },
    'qes472pj': {
      'es': '',
      'en': '',
    },
    'e92luva1': {
      'es': '',
      'en': '',
    },
    'tjybhxqw': {
      'es': '',
      'en': '',
    },
    'hj5w5y0f': {
      'es': '',
      'en': '',
    },
    'lwnwqvtl': {
      'es': '',
      'en': '',
    },
    'qblasycp': {
      'es': '',
      'en': '',
    },
    'sppwydda': {
      'es': '',
      'en': '',
    },
    '2muofy7z': {
      'es': '',
      'en': '',
    },
    'k7ylyscb': {
      'es': '',
      'en': '',
    },
    't4k5ja8k': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
