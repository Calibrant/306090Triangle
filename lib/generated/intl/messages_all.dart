// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_en.dart' as messages_en;
import 'messages_en_PH.dart' as messages_en_ph;
import 'messages_es.dart' as messages_es;
import 'messages_fr_CA.dart' as messages_fr_ca;
import 'messages_fr_FR.dart' as messages_fr_fr;
import 'messages_hi.dart' as messages_hi;
import 'messages_id.dart' as messages_id;
import 'messages_ko_KR.dart' as messages_ko_kr;
import 'messages_ms_MY.dart' as messages_ms_my;
import 'messages_pt_BR.dart' as messages_pt_br;
import 'messages_pt_PT.dart' as messages_pt_pt;
import 'messages_ru.dart' as messages_ru;
import 'messages_tl_PH.dart' as messages_tl_ph;
import 'messages_zh_CN.dart' as messages_zh_cn;
import 'messages_zh_HK.dart' as messages_zh_hk;
import 'messages_zh_TW.dart' as messages_zh_tw;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'en': () => new SynchronousFuture(null),
  'en_PH': () => new SynchronousFuture(null),
  'es': () => new SynchronousFuture(null),
  'fr_CA': () => new SynchronousFuture(null),
  'fr_FR': () => new SynchronousFuture(null),
  'hi': () => new SynchronousFuture(null),
  'id': () => new SynchronousFuture(null),
  'ko_KR': () => new SynchronousFuture(null),
  'ms_MY': () => new SynchronousFuture(null),
  'pt_BR': () => new SynchronousFuture(null),
  'pt_PT': () => new SynchronousFuture(null),
  'ru': () => new SynchronousFuture(null),
  'tl_PH': () => new SynchronousFuture(null),
  'zh_CN': () => new SynchronousFuture(null),
  'zh_HK': () => new SynchronousFuture(null),
  'zh_TW': () => new SynchronousFuture(null),
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'en':
      return messages_en.messages;
    case 'en_PH':
      return messages_en_ph.messages;
    case 'es':
      return messages_es.messages;
    case 'fr_CA':
      return messages_fr_ca.messages;
    case 'fr_FR':
      return messages_fr_fr.messages;
    case 'hi':
      return messages_hi.messages;
    case 'id':
      return messages_id.messages;
    case 'ko_KR':
      return messages_ko_kr.messages;
    case 'ms_MY':
      return messages_ms_my.messages;
    case 'pt_BR':
      return messages_pt_br.messages;
    case 'pt_PT':
      return messages_pt_pt.messages;
    case 'ru':
      return messages_ru.messages;
    case 'tl_PH':
      return messages_tl_ph.messages;
    case 'zh_CN':
      return messages_zh_cn.messages;
    case 'zh_HK':
      return messages_zh_hk.messages;
    case 'zh_TW':
      return messages_zh_tw.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new SynchronousFuture(false);
  }
  var lib = _deferredLibraries[availableLocale];
  lib == null ? new SynchronousFuture(false) : lib();
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new SynchronousFuture(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(
    locale,
    _messagesExistFor,
    onFailure: (_) => null,
  );
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
