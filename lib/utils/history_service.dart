// lib/utils/history_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculation_history_item.dart';

class HistoryService {
  static const String _historyKey = 'calculation_history_v2';
  static const int maxHistoryItems = 100; // Ограничение на количество записей

  static Future<List<CalculationHistoryItem>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? historyString = prefs.getString(_historyKey);
    if (historyString == null || historyString.isEmpty) {
      return [];
    }
    try {
      final List<dynamic> jsonData = jsonDecode(historyString);
      return jsonData
          .map((item) =>
              CalculationHistoryItem.fromJson(item as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => b.timestamp.compareTo(
            a.timestamp)); // Сортируем по убыванию времени (самые новые вверху)
    } catch (e) {
      // print("Error decoding history: $e"); // Для отладки
      // В случае ошибки декодирования, лучше вернуть пустой список или удалить поврежденные данные
      await clearHistory(); // Очищаем, если данные повреждены
      return [];
    }
  }

  static Future<void> saveHistory(List<CalculationHistoryItem> history) async {
    final prefs = await SharedPreferences.getInstance();
    // Сортируем перед сохранением, чтобы при загрузке они уже были в нужном порядке
    // и чтобы обрезка удаляла самые старые
    List<CalculationHistoryItem> sortedHistory = List.from(history);
    sortedHistory
        .sort((a, b) => b.timestamp.compareTo(a.timestamp)); // Новые вверху

    List<CalculationHistoryItem> toSave = sortedHistory;
    if (sortedHistory.length > maxHistoryItems) {
      toSave = sortedHistory.sublist(
          0, maxHistoryItems); // Берем первые N (самые новые)
    }

    final String historyString =
        jsonEncode(toSave.map((item) => item.toJson()).toList());
    await prefs.setString(_historyKey, historyString);
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  // Этот метод теперь не нужен, логика добавления будет в _MyHomePageState
  // static Future<void> addHistoryItem(CalculationHistoryItem item, List<CalculationHistoryItem> currentHistory) async {
  //   // ...
  // }
}
