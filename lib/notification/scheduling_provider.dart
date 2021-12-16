import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'background_service.dart';
import 'date_notification_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> pengingat(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Pengingat Aktif');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Pengingat Dibatalkan');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}