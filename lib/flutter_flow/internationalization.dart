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
  // hometest
  {
    'cxui5zra': {
      'es': 'Logout',
      'en': 'Logout',
    },
    'dadrk2d8': {
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
      'es': '¿Contraseña olvidada?',
      'en': 'Forgotten password',
    },
    'xod59m8a': {
      'es':
          'Proporcióna tu correo electronico y recibiras un correo con las instrucciónes para recuperarlo.',
      'en':
          'Provide your email and you will receive an email with instructions to recover it.',
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
    'nomb8pxl': {
      'es': 'arturo.ledezma@multimedios.com',
      'en': '',
    },
    '934jg1bu': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'f6mqg5lr': {
      'es': 'adminK2',
      'en': '',
    },
    'io3epr24': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'ikzu05rx': {
      'es': '¿No tienes una cuenta? ',
      'en': '¿You do not have an account?',
    },
    'ffks7vm9': {
      'es': '   Registrate aqui',
      'en': 'Sign up here',
    },
    'kjujmrwf': {
      'es': '¿Olvidaste tu contraseña? ',
      'en': '¿Did you forget your password?',
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
    'j8wkg47b': {
      'es': 'Las contraseñas no coinciden.',
      'en': 'Passwords do not match.',
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
    'a476v1z4': {
      'es': 'Field is required',
      'en': '',
    },
    '7kuo5u59': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bkylcv2k': {
      'es': 'Field is required',
      'en': '',
    },
    'ol1jrlna': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jrz07r5c': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // users
  {
    'u3rlh7y6': {
      'es': 'Usuarios de la plataforma',
      'en': 'Platform users',
    },
    'fh9jx6vy': {
      'es': 'Administración de usuarios, activación, desactivación',
      'en': 'User management, activation, deactivation',
    },
    'atzfupba': {
      'es': 'ID',
      'en': '',
    },
    '6wh125ym': {
      'es': 'Información del usuario',
      'en': '',
    },
    '8s8w9wu5': {
      'es': 'Miembro desde:',
      'en': '',
    },
    '5jchnrjc': {
      'es': 'Estatus',
      'en': '',
    },
    'j18ud3yq': {
      'es': 'Home',
      'en': '',
    },
  },
  // dashboardOld
  {
    'wzjz1p79': {
      'es': 'Resultados..',
      'en': 'Results..',
    },
    'xhpeb4v7': {
      'es': 'Panel',
      'en': 'Panel',
    },
    'krcwz6k1': {
      'es': 'Panel de Transcripciónes.',
      'en': 'Transcripts Panel.',
    },
    'uac74jhj': {
      'es': 'Imagen',
      'en': 'Image',
    },
    '061ti0bw': {
      'es': 'Título',
      'en': 'Title',
    },
    's3q70b3r': {
      'es': 'Duración',
      'en': 'Duration',
    },
    'oy1fd1bv': {
      'es': 'Creación',
      'en': 'Creation',
    },
    'w5t9sf8j': {
      'es': 'Autor',
      'en': 'Author',
    },
    'in97tsyy': {
      'es': 'Valoración',
      'en': 'Rating',
    },
    'qmdvzvzl': {
      'es': 'Opciónes',
      'en': 'Options',
    },
    '4mkdi0gb': {
      'es': 'Imagen',
      'en': 'Image',
    },
    'm3bodoen': {
      'es': 'Título',
      'en': 'Title',
    },
    'a6p8uo5x': {
      'es': 'Duración',
      'en': 'Duration',
    },
    'rka1ebux': {
      'es': 'Creación',
      'en': 'Creation',
    },
    'wzw7k0v5': {
      'es': 'Opciónes',
      'en': 'Options',
    },
    'yj8pkhne': {
      'es': 'Filas por pagina:',
      'en': '',
    },
    'q9qi7xpb': {
      'es': '40',
      'en': '',
    },
    'u9hy7h2j': {
      'es': '50',
      'en': '',
    },
    'r8euyl8q': {
      'es': '100',
      'en': '',
    },
    'xm431xce': {
      'es': 'Buscar...',
      'en': '',
    },
    'edm2kgol': {
      'es': 'Busquedas...',
      'en': 'Searches...',
    },
    'uwfqnhgg': {
      'es': 'v21',
      'en': 'v21',
    },
    'qvd73nco': {
      'es': 'Home',
      'en': '',
    },
  },
  // dashboard
  {
    'kxgyog9v': {
      'es': 'Resultados..',
      'en': 'Results..',
    },
    'dhyztyd0': {
      'es': 'Panel',
      'en': 'Panel',
    },
    'tgyc8m53': {
      'es': 'Panel de Transcripciónes.',
      'en': 'Transcripts Panel.',
    },
    's987gbxb': {
      'es': 'Filas por pagina:',
      'en': '',
    },
    'as4gz8e0': {
      'es': '10',
      'en': '',
    },
    'm44mrcgf': {
      'es': '40',
      'en': '',
    },
    'dsced62g': {
      'es': '50',
      'en': '',
    },
    'ylfz619c': {
      'es': '100',
      'en': '',
    },
    '0jg0ltkw': {
      'es': 'Buscar...',
      'en': '',
    },
    'b0o7thrc': {
      'es': 'Imagen',
      'en': 'Image',
    },
    'k54tynzr': {
      'es': 'Título',
      'en': 'Title',
    },
    '3cbzz5i4': {
      'es': 'Duración',
      'en': 'Duration',
    },
    'com15ekj': {
      'es': 'Creación',
      'en': 'Creation',
    },
    'fkgz6ozu': {
      'es': 'Autor',
      'en': 'Author',
    },
    'eiwnidn3': {
      'es': 'Valoración',
      'en': 'Rating',
    },
    '5w67oup2': {
      'es': 'Opciónes',
      'en': 'Options',
    },
    'gsj4ehtl': {
      'es': 'Imagen',
      'en': 'Image',
    },
    'g316lqn2': {
      'es': 'Título',
      'en': 'Title',
    },
    '4vn8edqx': {
      'es': 'Duración',
      'en': 'Duration',
    },
    'q19y36wm': {
      'es': 'Creación',
      'en': 'Creation',
    },
    'dc0ln6kk': {
      'es': 'Opciónes',
      'en': 'Options',
    },
    'jzp5rbeh': {
      'es': 'Busquedas...',
      'en': 'Searches...',
    },
    'da9gtcq4': {
      'es': 'Home',
      'en': '',
    },
  },
  // keywordspage
  {
    'w4rf1i0q': {
      'es': 'Palabras Clave',
      'en': 'Keywords',
    },
    'azvmb0op': {
      'es': 'Palabras Clave',
      'en': 'Keywords',
    },
    '5sedmpz5': {
      'es': 'Home',
      'en': '',
    },
  },
  // details
  {
    'cul8lt3v': {
      'es': 'Duración:',
      'en': '',
    },
    'anmo0nx5': {
      'es': ' || ',
      'en': '',
    },
    'rckmtohv': {
      'es': 'Disponible',
      'en': 'Available',
    },
    'csow4e5b': {
      'es': 'Resumen',
      'en': 'Summary',
    },
    '7ex11614': {
      'es': 'Personajes',
      'en': 'Characters',
    },
    'a54s98aq': {
      'es': 'Titulares',
      'en': 'Headlines',
    },
    'tp9jggqn': {
      'es': 'Total de palabras',
      'en': 'Total words',
    },
    '8jccglw4': {
      'es': 'Descargar',
      'en': 'Download',
    },
    'q14k52bj': {
      'es': 'Transcripción',
      'en': 'Transcription',
    },
    'ts87n37q': {
      'es': 'Upss! algo salio mal con el video o la transcripción...',
      'en': 'Oops! something went wrong with the video or the transcription...',
    },
    '23kruf6n': {
      'es': 'Autor',
      'en': 'Author',
    },
    'g9nmjppv': {
      'es': 'Resumen',
      'en': 'Summary',
    },
    'z3r3s1ff': {
      'es': 'Palabras clave',
      'en': 'Keywords',
    },
    'r9dnbayy': {
      'es': 'Home',
      'en': '',
    },
  },
  // ProfilePage
  {
    '25q06bix': {
      'es': 'Acceso a:',
      'en': 'Access to:',
    },
    '7lx7agpi': {
      'es': 'Información de mi cuenta',
      'en': 'My account information',
    },
    'qwy0a6mq': {
      'es': 'Cambiar password',
      'en': 'Change password',
    },
    'emllpp2g': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    'h1l7c2dx': {
      'es': 'Soporte',
      'en': 'Medium',
    },
    'g1wkim9h': {
      'es': 'Tutorial',
      'en': 'Tutorial',
    },
    'yh43vwml': {
      'es': 'Reportar un problema',
      'en': 'report a problem',
    },
    'qyh1klmt': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'eofk0yzt': {
      'es': 'Light ',
      'en': '',
    },
    'iqe8yt55': {
      'es': 'Dark',
      'en': '',
    },
    'kfran9zk': {
      'es': 'Salir',
      'en': 'Log Out',
    },
    'h2es946e': {
      'es': 'Mi Perfil',
      'en': 'My profile',
    },
    'mft9a193': {
      'es': '__',
      'en': '',
    },
  },
  // sideNav_Mail
  {
    'q6pp7ws2': {
      'es': 'Panel',
      'en': 'Panel',
    },
    'p2klqhvm': {
      'es': 'Estatus',
      'en': 'Status',
    },
    'ek3ckqq5': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    '7xxwk6ow': {
      'es': 'Administración',
      'en': 'Administration',
    },
    'nd6d3iik': {
      'es': 'Usuarios',
      'en': 'Users',
    },
  },
  // UploadsButton
  {
    'ek5uilky': {
      'es': 'Subir',
      'en': 'Upload',
    },
  },
  // PlayerBusquedas
  {
    'ywbytf7y': {
      'es': 'bUSQUWDAS',
      'en': '',
    },
    'xu8dmsc4': {
      'es': 'Transcripciòn',
      'en': '',
    },
    '83g1d8hg': {
      'es': 'Resumen',
      'en': '',
    },
    'iepw77ct': {
      'es': 'Etiquetas',
      'en': '',
    },
    'xiec0ec0': {
      'es': 'Informaciòn',
      'en': '',
    },
    '3mnnvfph': {
      'es': '00:01',
      'en': '',
    },
    'xh2cffsq': {
      'es': 'Hello World',
      'en': '',
    },
    'n59qhwj5': {
      'es': 'Personajes',
      'en': '',
    },
    'jl3cp18k': {
      'es': 'Hello World',
      'en': '',
    },
    'fsra0mdw': {
      'es': 'Option 1',
      'en': '',
    },
    'ztxfea2i': {
      'es': '\n',
      'en': '',
    },
    'wba3qmor': {
      'es': 'informaciòn',
      'en': '',
    },
    '19bocoi9': {
      'es': 'Datos acerca de la media.',
      'en': '',
    },
    'zp4idrkb': {
      'es': 'Fecha de Creaciòn',
      'en': '',
    },
    '3cbw2rxn': {
      'es': '4m ago',
      'en': '',
    },
    'hmp7x2sx': {
      'es': 'Ultima Actualizaciòn',
      'en': '',
    },
    'ntoiyslj': {
      'es': '4m ago',
      'en': '',
    },
    'et4q50jf': {
      'es': 'Fuente',
      'en': '',
    },
    'cwzb43qc': {
      'es': '4m ago',
      'en': '',
    },
    'obafigrs': {
      'es': 'Rudy Fernandez',
      'en': '',
    },
    'zd0mrtnx': {
      'es': 'Creador',
      'en': '',
    },
    'vmoyz0ap': {
      'es': '',
      'en': '',
    },
    'g69n4hj6': {
      'es': 'Resumen',
      'en': '',
    },
    'snflzq8j': {
      'es': 'Hello World',
      'en': '',
    },
    '6szcgebe': {
      'es': '',
      'en': '',
    },
    '1h76s3iw': {
      'es': 'Resumen extendido',
      'en': '',
    },
    'pw26wzyg': {
      'es': 'Hello World',
      'en': '',
    },
    'ugacbtj8': {
      'es': '',
      'en': '',
    },
    'lgs85b8z': {
      'es': 'Titulares',
      'en': '',
    },
    '90t0j0te': {
      'es': 'Hello World',
      'en': '',
    },
    'srkg5uch': {
      'es': 'Duraciòn',
      'en': '',
    },
    '9msq6s5z': {
      'es': 'Duraciòn',
      'en': '',
    },
    'umpelbif': {
      'es': '00:01',
      'en': '',
    },
    'olwikn8l': {
      'es': 'Hello World',
      'en': '',
    },
  },
  // AlertEndSesion
  {
    'laeoua8l': {
      'es': 'Tu sesion caducara pronto',
      'en': 'Your session will expire soon',
    },
    '8zd42szu': {
      'es': 'Quieres continuar?',
      'en': 'Do you want to continue?',
    },
    'cq6e5efp': {
      'es': 'Salir de la aplicación',
      'en': 'Exit application',
    },
    'c5t9oyle': {
      'es': 'Continuar',
      'en': 'Continue',
    },
  },
  // UserSettings
  {
    'vztqwjgg': {
      'es': 'Ajustes',
      'en': 'Settings',
    },
    'w4o4usg7': {
      'es': 'Cambiar password.',
      'en': 'Change password.',
    },
    'erowuj1t': {
      'es': 'Cambia tu password.',
      'en': 'Change your password.',
    },
    '4922912g': {
      'es': 'Salir',
      'en': 'Go out',
    },
    '7hblt8lt': {
      'es': 'Cerrar mi sesion.',
      'en': 'Close my session.',
    },
  },
  // MensajeRating
  {
    'aa2u61r8': {
      'es': 'Hola!',
      'en': '',
    },
    'o1mgntdq': {
      'es':
          'Solo la persona propietaria de la transcripción puede calificarla.',
      'en': '',
    },
  },
  // ChoiceKeywords
  {
    'blctitrc': {
      'es': 'Option 1',
      'en': '',
    },
  },
  // searchComponent
  {
    'ntqdgjis': {
      'es': 'Search platform...',
      'en': '',
    },
    'y7vjr70e': {
      'es': 'Limpiar',
      'en': 'Clean',
    },
    '7i2l1y30': {
      'es': '¿Que buscamos hoy?',
      'en': 'What are we looking for today?',
    },
    'juv76i5d': {
      'es': 'Reproducir',
      'en': 'play',
    },
    's5zonvmp': {
      'es': 'ESC',
      'en': 'To close',
    },
    'hfcup9g8': {
      'es': 'Para cerrar',
      'en': 'To close',
    },
  },
  // ProfileComponent
  {
    'j4g12cp9': {
      'es': 'Opciónes de mi cuenta',
      'en': 'My account options',
    },
    'rqswz96x': {
      'es': 'Mi Cuenta',
      'en': 'My account',
    },
    'wz805e6s': {
      'es': 'Ajustes',
      'en': 'Settings',
    },
    't449lwzn': {
      'es': 'Light Mode',
      'en': '',
    },
    'bq14hloq': {
      'es': 'Dark Mode',
      'en': '',
    },
    'tgts6mx8': {
      'es': 'Salir de la aplicación',
      'en': 'Exit application',
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
