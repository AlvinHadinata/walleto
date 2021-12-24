import 'package:hive/hive.dart';
import 'package:walleto/data/model/history_target.dart';

class HistoryTargetBoxes {
  static Box<HistoryTarget> getHistoryTarget() =>
      Hive.box<HistoryTarget>("history_target");

  static void storeHistoryTarget(HistoryTarget historyTarget) {
    getHistoryTarget().add(historyTarget);
  }

  static void deleteHistoryTarget(String foreignKey) {
    final Map<dynamic, HistoryTarget> boxMap = getHistoryTarget().toMap();
    dynamic boxKey;
    boxMap.forEach((key, value) {
      if (value.foreign == foreignKey) {
        boxKey = key;
        getHistoryTarget().delete(boxKey);
      }
    });
  }
}
