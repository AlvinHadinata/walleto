import 'package:flutter/material.dart';
import 'package:walleto/notification/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  late PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getPengingat();
  }

  bool _isPengingatAktif = false;
  bool get isPengingatAktif => _isPengingatAktif;

  void _getPengingat() async {
    _isPengingatAktif = await preferencesHelper.isDailyNewsActive;
    notifyListeners();
  }

  void enablePengingat(bool value) {
    preferencesHelper.setDailyNews(value);
    _getPengingat();
  }
}