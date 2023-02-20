import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['hr', 'en'];

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
    String? hrText = '',
    String? enText = '',
  }) =>
      [hrText, enText][languageIndex] ?? '';

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
    'zhdhsb7d': {
      'hr':
          'Ako se problemi ne rješavaju kontinuirano i sustavno, javlja se niz negativnih posljedica koje prije ili kasnije generiraju nove probleme.\nTo dovodi do stanja postignuća koja su uvijek manja od potencijala, potreba i želja.\nStanje kada se problemi ne rješavaju neizostavno dovodi do poremećenih odnosa koji vremenom sve više eskaliraju i još više umanjuju rezultat.\n\nEvo samo nekoliko negativnih posljedica nerješavanja problema:\n\n- Bavite se prvenstveno rutinama zbog uklanjanja posljedica nerješavanja problema,\n- Problem dolazi kad tad na naplatu uz nepotrebno trošenje resursa,\n- Izbjegavanje potrebnih aktivnosti koje su vezane uz problem,\n- Kroničan nedostatak vremena,\n- Pad učinkovitosti / produktivnosti,\n- Poremećeni međuljudski odnosi,\n- Optuživanje za neuspjeh,\n- Koči se one koji žele biti proaktivni,\n- Stvaranje loše slike kod korisnika,\n- Negativno brendiranje,\n- Smatraju nas nepouzdanima,\n- Nema se vremena za unapređenja i razvoj,\n- Otežano uvođenje novozaposlenih jer ih se uči kako se problemi ne rješavaju što ubrzo donosi dodatne probleme,\n- Veća vjerojatnost za odlazak ključnih zaposlenika,\n- Nerješavanje problema generira i druga \"kancerogena\" stanja da se ne čini (delegiranje, kontrola, pripreme za sastanke, donošenje odluka, unapređenja, ...),\n- Nerješavanje problema je povezano s kašnjenjem pa se na taj način gubi kredibilitet,\n- Nerješavanje problema inicira nepotrebne i neučinkovite sastanke,\n- Rezultat je uvijek manji od potencijala, potreba i želja,\n- Kada voda dođe do grla, problemi se rješavaju improvizacijom što stvara dodatne probleme.\n\nSva gore navedena i mnoga druga nenavedena negativna stanja su nepotrebna i u potpunosti se uklanjaju primjenom MUI rješavanja problema što je i predmet ove knjige.\n\nZAKLJUČAK\n\nPosljedice nerješavanja problema:\n1. Rezultati će biti uvijek manji od potencijala, potreba i želja.\nVećina vremena se troši na uklanjanje posljedica nerješavanja problema (\"gašenje\" vatre), a ne na trajnom uklanjanju uzroka (preventiva svim budućim problemima).\n2.To je neracionalno trošenje resursa koje se ne može ničim opravdati',
      'en':
          'If problems are not solved continuously and systematically, a series of negative consequences occur that sooner or later generate new problems.\nThis leads to states of achievement that are always less than potential, needs and desires.\nThe situation when problems are not solved inevitably leads to disturbed relationships that escalate over time and reduce the result even more.\n\nHere are just a few negative consequences of not solving the problem:\n\n- You deal primarily with routines in order to eliminate the consequences of not solving the problem,\n- The problem sometimes comes at the expense of unnecessary resources,\n- Avoiding necessary activities related to the problem,\n- Chronic lack of time,\n- Decrease in efficiency / productivity,\n- Disrupted interpersonal relationships,\n- Accusation of failure,\n- It hinders those who want to be proactive,\n- Creating a bad image for users,\n- Negative branding,\n- They consider us unreliable,\n- There is no time for improvements and development,\n- Difficult introduction of new employees because they are taught that problems are not solved, which soon brings additional problems,\n- Higher probability of departure of key employees,\n- Failure to solve the problem generates other \"cancerous\" conditions that do not occur (delegating, controlling, preparing for meetings, making decisions, promotions, ...),\n- Failure to solve the problem is associated with delay, so credibility is lost in this way,\n- Failure to solve the problem initiates unnecessary and ineffective meetings,\n- The result is always less than the potential, needs and desires,\n- When the water reaches the throat, problems are solved by improvisation, which creates additional problems.\n\nAll of the above and many other unmentioned negative states are unnecessary and can be completely eliminated by applying MUI problem solving, which is the subject of this book.\n\nCONCLUSION\n\nConsequences of not solving the problem:\n1. The results will always be less than the potential, needs and desires.\nMost of the time is spent on removing the consequences of not solving the problem (\"putting out\" the fire), not on permanently removing the cause (prevention of all future problems).\n2. It is an irrational waste of resources that cannot be justified by anything',
    },
    'nqdgtmct': {
      'hr': '1 Opis elementa',
      'en': '1 Description of the element',
    },
    'epozarn1': {
      'hr': 'SASTANCI',
      'en': 'MEETINGS',
    },
    '0fx3jcew': {
      'hr': '2 Definicije',
      'en': '2 Definitions',
    },
    '0d0ndc29': {
      'hr': '3 Praktikum',
      'en': '3 Practicum',
    },
    '4z2l5qsm': {
      'hr': 'MUE',
      'en': 'MUE',
    },
  },
  // STRANICA2
  {
    'g5mj3g3l': {
      'hr': 'FAZE SASTANKA',
      'en': 'PHASES OF THE MEETING',
    },
    'jwa6ump4': {
      'hr': '1. Priprema sastanka',
      'en': '1. Preparation of the meeting',
    },
    '1wpwe9jo': {
      'hr': '2. Tijek sastanka',
      'en': '2. Course of the meeting',
    },
    'r97r7uk7': {
      'hr': '3. Aktivnosti poslije sastanka',
      'en': '3. Activities after the meeting',
    },
    'k9dwbtrh': {
      'hr': '1. Priprema sastanka',
      'en': '1. Preparation of the meeting',
    },
    'd9tufvn1': {
      'hr':
          '1. Definirati vrijeme trajanja sastanka i apsolutno to poštivati.\nNema ni jedan objektivan razlog da sastanak traje duže od 30 minuta.\nAko je moguće, neka bude i kraći (ali se mora unaprijed točno definirati koliko traje).\nObvezno koristiti brojač na mobitelu za mjerenje trajanja sastanka. Kada se oglasi alarm, sastanak se automatski prekida. Ništa se strašno neće dogoditi ako se sastanak prekine - naprotiv svi će se u okviru planiranog vremena koncentrirati i postepeno se disciplinirati od upadanja, iznošenja nevažnih i poznatih stvari, skretanja s teme, inaćenja, pokazivanje isprazne dominacije, …',
      'en':
          '1. Define the duration of the meeting and absolutely respect it.\nThere is no objective reason for the meeting to last longer than 30 minutes.\nIf possible, make it shorter (but how long it lasts must be defined in advance).\nIt is mandatory to use the counter on your mobile phone to measure the duration of the meeting. When the alarm sounds, the meeting is automatically interrupted. Nothing terrible will happen if the meeting is interrupted - on the contrary, everyone will concentrate within the planned time and gradually discipline themselves from intruding, bringing up unimportant and familiar things, digressing from the topic, being spiteful, showing vain dominance, ...',
    },
    'pyj204d5': {
      'hr': '2. Tijek sastanka',
      'en': '2. Course of the meeting',
    },
    'cikqeqyu': {
      'hr':
          '2. Obvezna priprema sudionika za sastanak\nSudionik sastanka koji ima obvezu dati informaciju u okviru svoje nadležnosti i ovlaštenja čini to kroz sljedeća dva elementa:\n1. Trenutačno stanje,\n2. Sljedeće potrebne aktivnosti.\nSvaki sudionik mora obvezno imati pisanu pripremu za sastanak. To se radi tako da obveznik izvješćivanja ima predložak (kontrolnik) o kojim elementima se daje izvješće.\nIzrada kontrolnika je proces koji traje dok se ne postigne učinkovito izvješćivanje koje će davati cjelovitu sliku predmetne problematike.\nNapomena: Svako verbalno iskazivanje stanja bez zapisivanja je improvizacija koja će uvijek stvoriti brojne probleme.\nZapisivanje ne znači dugačko (gubitak vremena), naprotiv, znači kratko (dati ključne informacije).',
      'en':
          '2. Mandatory preparation of participants for the meeting\nA meeting participant who has the obligation to provide information within the scope of his competence and authority does so through the following two elements:\n1. Current situation,\n2. The following necessary activities.\nEvery participant must have a written preparation for the meeting. This is done so that the reporting party has a template (controller) on which elements to report.\nCreating a controller is a process that lasts until effective reporting is achieved, which will give a complete picture of the issue in question.\nNote: Any verbal statement of the state without writing it down is an improvisation that will always create numerous problems.\nWriting down does not mean long (wasting time), on the contrary, it means short (give key information).',
    },
    'qgkj5kcv': {
      'hr': '3. Aktivnosti poslije sastanka',
      'en': '3. Activities after the meeting',
    },
    '9u7b0qt7': {
      'hr':
          '3. Obvezno strukturiranje donesenih odluka\nSve što nije zapisano, neće se dogoditi!\nAko odluke sa sastanka nisu cjelovito opisane, svatko će ih tumačiti na svoj način (objektivno jer ne shvaća o čemu se radi ili subjektivno zbog osobnog interesa) i provedba je neizvjesna uz veliku vjerojatnost kako će doći do nerazumijevanja, nesporazuma, sukoba, …\nCjelovito definiranje odluke je jedino moguće uz strukturiranje pomoću sljedećih devet (9) sastavnica:\n\n1. Što? (ciljevi),\n2. Zašto? (razlozi za promjenu),\n3. Kako? (procedure),\n4. S čime? (resursi),\n5. Tko? (sudionici),\n6. Gdje? (mjesta događanja),\n7. Kada? (rokovi),\n8. Izvijestiti (izvješća),\n9. Nastavak? (sljedeće aktivnosti).\nOvaj alat se zove Osnovna pitanja i osnovni je alat za postizanje izvrsnosti primjenom Modela univerzalne izvrsnosti – MUI.',
      'en':
          '3. Compulsory structuring of the decisions made\nEverything that is not written down, will not happen!\nIf the decisions from the meeting are not fully described, everyone will interpret them in their own way (objectively because they do not understand what it is about or subjectively because of personal interest) and the implementation is uncertain with a high probability that there will be misunderstandings, conflicts, ...\nA complete definition of the decision is only possible with structuring using the following nine (9) components:\n\n1. What? (Goals),\n2. Why? (reasons for change),\n3. How? (procedures),\n4. With what? (resources),\n5. Who? (participants),\n6. Where? (venues),\n7. When? (deadlines),\n8. Report (reports),\n9. Continuation? (following activities).\nThis tool is called Basic Questions and is the basic tool for achieving excellence by applying the Model of Universal Excellence - MUI.',
    },
    '6tv7voxa': {
      'hr': 'SASTANCI',
      'en': 'MEETINGS',
    },
    'uz5oae8x': {
      'hr': 'Home',
      'en': 'Home',
    },
  },
  // GridView
  {
    'ns1okjb7': {
      'hr': 'GridView',
      'en': 'Page Title',
    },
    '0s97dew6': {
      'hr': 'Slika 1',
      'en': '',
    },
    '8ucdv5s3': {
      'hr': 'Slika 1',
      'en': '',
    },
    'wz8ksky0': {
      'hr': 'Slika 1',
      'en': '',
    },
    'mszd9km3': {
      'hr': 'Slika 1',
      'en': '',
    },
    'h003gm0h': {
      'hr': 'Slika 1',
      'en': '',
    },
    '6aj7ups2': {
      'hr': 'Slika 1',
      'en': '',
    },
    'oahpbx91': {
      'hr': 'Slika 1',
      'en': '',
    },
    '86pgokpl': {
      'hr': 'Slika 1',
      'en': '',
    },
    'w818ylyb': {
      'hr': 'Slika 1',
      'en': '',
    },
    'emqh8pip': {
      'hr': 'Slika 1',
      'en': '',
    },
    '9szfdd76': {
      'hr': 'Slika 1',
      'en': '',
    },
    'i7jjnpt2': {
      'hr': 'Slika 1',
      'en': '',
    },
    'oal2ergg': {
      'hr': 'Slika 1',
      'en': '',
    },
    'vxjlcw31': {
      'hr': 'Slika 1',
      'en': '',
    },
    'dfw7w1xo': {
      'hr': 'Slika 1',
      'en': '',
    },
    'y6zj5mqe': {
      'hr': 'Slika 1',
      'en': '',
    },
    'khd4cqmv': {
      'hr': 'Slika 1',
      'en': '',
    },
    'qybyu91t': {
      'hr': 'Slika 1',
      'en': '',
    },
    'qaro40y6': {
      'hr': 'Slika 1',
      'en': '',
    },
    '1n2y28id': {
      'hr': 'Slika 1',
      'en': '',
    },
    'qy4c7x7z': {
      'hr': 'Slika 1',
      'en': '',
    },
    '4ywcflp1': {
      'hr': 'Home',
      'en': 'Home',
    },
  },
  // Button
  {
    'zhaq3loi': {
      'hr': 'Pošalji',
      'en': '',
    },
    '84pvuami': {
      'hr': 'Button',
      'en': 'Page Title',
    },
    'p6fmayp6': {
      'hr': 'Home',
      'en': 'Home',
    },
  },
  // RichText
  {
    '6adv0stj': {
      'hr': 'Rich Text',
      'en': 'Page Title',
    },
    '9yvdnath': {
      'hr': 'SELEKTIRANI TEKST',
      'en': '',
    },
    'ahzw9gnk': {
      'hr': 'BOGAT TEKST',
      'en': '',
    },
    'vttphcq1': {
      'hr': ' Bogati tekst',
      'en': '',
    },
    'zp2npevr': {
      'hr': 'MOGUĆNOST RAZLIČITOG FORMATIRANJA TEKSTA.',
      'en': '',
    },
    '3njooi2p': {
      'hr': 'Home',
      'en': 'Home',
    },
  },
  // STRANICA6
  {
    '767lybu0': {
      'hr': 'BOOKMARKS',
      'en': 'BOOKMARKS',
    },
    'q6rvuiqg': {
      'hr': 'Bookmark',
      'en': 'Bookmark',
    },
  },
  // definicije
  {
    'k9v6ln6z': {
      'hr': 'DEFINICIJE',
      'en': 'DEFINITIONS',
    },
    'ehu43aes': {
      'hr':
          'SASTANAK je svaki kontakt s bilo kojom osobom, \nna bilo koji način i u bilo koje vrijeme.',
      'en':
          'A MEETING is any contact with any person,\nin any way and at any time.',
    },
    'zsevyl8c': {
      'hr': ' \n KORISNI LINKOVI  ',
      'en': 'USEFUL LINKS',
    },
    'xqho8rkw': {
      'hr': 'Savjeti za učinkovitije sastanke ',
      'en': 'Tips for more effective meetings',
    },
    'a2bnppcq': {
      'hr': 'Home',
      'en': 'Home',
    },
  },
  // Main_menu
  {
    'ubzx8u6y': {
      'hr': 'Page Title',
      'en': '',
    },
    '4da55ypi': {
      'hr': 'Home',
      'en': '',
    },
  },
  // template1
  {
    'xk87tpdr': {
      'hr': 'Create Task',
      'en': '',
    },
    '3zqpzbnu': {
      'hr': 'Task Name',
      'en': '',
    },
    '65fhkl23': {
      'hr': 'Enter description here...',
      'en': '',
    },
    'zp35s11d': {
      'hr': 'Team 1',
      'en': '',
    },
    'di7fkal3': {
      'hr': 'Team 2',
      'en': '',
    },
    'ww9ctjz1': {
      'hr': 'Team 3',
      'en': '',
    },
    'c9dgwf8s': {
      'hr': 'Select Team',
      'en': '',
    },
    'zdrxeovu': {
      'hr': 'User 1',
      'en': '',
    },
    'zjeuuu6c': {
      'hr': 'Team 2',
      'en': '',
    },
    '28i82i28': {
      'hr': 'Team 3',
      'en': '',
    },
    'se7qqalk': {
      'hr': 'Select User',
      'en': '',
    },
    '8xxs6uam': {
      'hr': 'Not Started',
      'en': '',
    },
    'smtmz4lv': {
      'hr': 'In Progress',
      'en': '',
    },
    'rdtva9oq': {
      'hr': 'Complete',
      'en': '',
    },
    '6ausqw9n': {
      'hr': 'Select Status',
      'en': '',
    },
    'kvso4y9p': {
      'hr': 'Start Date',
      'en': '',
    },
    'l0jjs45d': {
      'hr': 'Due Date',
      'en': '',
    },
    'h7468xsa': {
      'hr': 'Create Task',
      'en': '',
    },
    '8k7azvjg': {
      'hr': 'Field is required',
      'en': '',
    },
    '9m80z0xv': {
      'hr': 'Field is required',
      'en': '',
    },
    'ndd2pu2u': {
      'hr': 'Field is required',
      'en': '',
    },
    '30ezpkd0': {
      'hr': 'Field is required',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'yqaijz24': {
      'hr': '',
      'en': '',
    },
    '0tnlrao9': {
      'hr': '',
      'en': '',
    },
    'zbm9peae': {
      'hr': '',
      'en': '',
    },
    '1wgn2lwm': {
      'hr': '',
      'en': '',
    },
    'wke99lgy': {
      'hr': '',
      'en': '',
    },
    'zo570qnd': {
      'hr': '',
      'en': '',
    },
    '19moay61': {
      'hr': '',
      'en': '',
    },
    'ewbccydi': {
      'hr': '',
      'en': '',
    },
    '3pc1gp3k': {
      'hr': '',
      'en': '',
    },
    'ahlj5m5j': {
      'hr': '',
      'en': '',
    },
    'h42gg7nx': {
      'hr': '',
      'en': '',
    },
    '2pjd1egv': {
      'hr': '',
      'en': '',
    },
    'fec5jidr': {
      'hr': '',
      'en': '',
    },
    'qcngmzu6': {
      'hr': '',
      'en': '',
    },
    'zl6lb76h': {
      'hr': '',
      'en': '',
    },
    'bnqgvrod': {
      'hr': '',
      'en': '',
    },
    'c0zjc40e': {
      'hr': '',
      'en': '',
    },
    'wq4yrtao': {
      'hr': '',
      'en': '',
    },
    'lq7xjpov': {
      'hr': '',
      'en': '',
    },
    'yrkxv6wx': {
      'hr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
