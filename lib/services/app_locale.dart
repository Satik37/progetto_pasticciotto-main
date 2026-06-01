import 'package:flutter/material.dart';

final ValueNotifier<Locale> appLocaleNotifier = ValueNotifier<Locale>(
  WidgetsBinding.instance.platformDispatcher.locale.languageCode.isEmpty
      ? const Locale('en')
      : Locale(WidgetsBinding.instance.platformDispatcher.locale.languageCode),
);
