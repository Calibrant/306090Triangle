// lib/widgets/history_view_widget.dart
import 'package:flutter/material.dart';
import 'package:triangle_306090/l10n/app_localizations.dart';
import '../models/calculation_history_item.dart';
import 'package:intl/intl.dart'; // Для форматирования даты

class HistoryViewWidget extends StatelessWidget {
  final List<CalculationHistoryItem> historyItems;
  final VoidCallback onClearHistory;

  const HistoryViewWidget({
    Key? key,
    required this.historyItems,
    required this.onClearHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // Получаем локализацию
    final theme = Theme.of(context);
    // Для темной темы фон контейнера истории будет другим
    final containerColor = theme.brightness == Brightness.dark
        ? Colors.green[800]?.withValues(alpha: 0.3)
        : Colors.green[100];
    final titleColor = theme.brightness == Brightness.dark
        ? Colors.greenAccent[100]
        : Colors.green[800];
    // Цвет даты: используем hintColor, он обычно хорошо адаптируется
    final dateColor = theme.hintColor;

    final DateFormat dateFormat = DateFormat(
        'dd.MM.yy HH:mm', l10n.localeName); // Короткий формат даты и времени

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: containerColor, // Адаптивный фон
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.historySectionTitle, // Локализованный заголовок
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: titleColor, // Адаптивный цвет заголовка
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.delete_outline, color: Colors.red[700]),
                label: Text(
                  l10n.clearButton, // Локализованная кнопка
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                onPressed: historyItems.isEmpty
                    ? null
                    : onClearHistory, // Деактивируем, если история пуста
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ],
          ),
          const Divider(),
          if (historyItems.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  l10n.emptyHistoryPlaceholder, // Локализованный плейсхолдер
                  style: TextStyle(color: theme.hintColor),
                ),
              ),
            )
          else
            // Используем SizedBox для ограничения высоты и делаем ListView прокручиваемым
            SizedBox(
              height:
                  250, // Задаем фиксированную высоту для прокручиваемой области
              child: ListView.builder(
                itemCount: historyItems.length,
                itemBuilder: (context, index) {
                  final item = historyItems[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${l10n.inputLabel}: ${item.inputSideName} = ${item.inputValue.toStringAsFixed(2)}',
                            style: theme.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${l10n.resultLabel}: A:${item.sideA.toStringAsFixed(2)}, B:${item.sideB.toStringAsFixed(2)}, C:${item.sideC.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '${l10n.areaLabel}: ${item.area.toStringAsFixed(2)}, ${l10n.perimeterLabel}: ${item.perimeter.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              dateFormat.format(item.timestamp.toLocal()),
                              style: TextStyle(
                                fontSize: 10,
                                color: dateColor, // Адаптивный цвет даты
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
