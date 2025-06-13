// lib/screens/full_history_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:triangle_306090/l10n/app_localizations.dart';
import '../models/calculation_history_item.dart';
import '../utils/history_service.dart';

class FullHistoryPage extends StatefulWidget {
  const FullHistoryPage({super.key});

  @override
  State<FullHistoryPage> createState() => _FullHistoryPageState();
}

class _FullHistoryPageState extends State<FullHistoryPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Сохраняем состояние страницы

  List<CalculationHistoryItem> _history = [];
  bool _isLoading = true; // Для отслеживания первоначальной загрузки

  @override
  void initState() {
    super.initState();
    _loadFullHistory(); // Загружаем историю при первой инициализации состояния
  }

  Future<void> _loadFullHistory() async {
    if (!mounted) return;
    // Если это не первоначальная загрузка (т.е. _isLoading уже false), 
    // то это обновление через RefreshIndicator, и мы не хотим показывать общий CircularProgressIndicator.
    // Но если _history еще пуст, то _isLoading должен быть true.
    if (_history.isEmpty) { // Если история пуста, всегда ставим isLoading в true перед загрузкой
         setState(() => _isLoading = true);
    }

    final loadedHistory = await HistoryService.loadHistory();
    if (!mounted) return;
    setState(() {
      _history = loadedHistory;
      _isLoading = false; // Загрузка завершена
    });
  }

  Future<void> _clearAllHistory() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.confirmClearHistoryTitle),
          content: Text(l10n.confirmClearHistoryContent),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.cancelButton),
              onPressed: () => Navigator.of(dialogContext).pop(false),
            ),
            TextButton(
              child: Text(l10n.clearButton, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onPressed: () => Navigator.of(dialogContext).pop(true),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await HistoryService.clearHistory();
      if (mounted) {
        setState(() {
          _history.clear();
          _isLoading = false; // После очистки загрузка не нужна, список пуст
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.historyCleared)));
      }
    }
  }

  void _shareHistoryItem(BuildContext tileContext, CalculationHistoryItem item) {
    final l10n = AppLocalizations.of(context)!;
    final DateFormat dateFormat = DateFormat('dd.MM.yyyy HH:mm', l10n.localeName);

    final String textToShare = l10n.calculationDetails(
      item.inputSideName,
      item.inputValue.toStringAsFixed(2),
      item.sideA.toStringAsFixed(2),
      item.sideB.toStringAsFixed(2),
      item.sideC.toStringAsFixed(2),
      item.area.toStringAsFixed(2),
      item.perimeter.toStringAsFixed(2)
    ) + "\n${l10n.timeLabel}: ${dateFormat.format(item.timestamp.toLocal())}";

    final RenderBox? box = tileContext.findRenderObject() as RenderBox?;
    Share.share(
      textToShare,
      subject: l10n.shareCalculation,
      sharePositionOrigin: box != null ? box.localToGlobal(Offset.zero) & box.size : null,
    ).catchError((e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sharing: $e. Please try again.')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Важно для AutomaticKeepAliveClientMixin
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final DateFormat dateFormat = DateFormat('dd.MM.yyyy HH:mm', l10n.localeName);

    Widget pageContent;

    if (_isLoading && _history.isEmpty) {
      // Показываем индикатор только при самой первой загрузке, когда история еще не отображалась
      pageContent = const Center(child: CircularProgressIndicator());
    } else if (_history.isEmpty) {
      // История пуста (либо после загрузки, либо после очистки)
      pageContent = RefreshIndicator(
        onRefresh: _loadFullHistory,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6 - (Scaffold.of(context).appBarMaxHeight ?? 0), // Учитываем высоту AppBar
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history_toggle_off_outlined, size: 60, color: theme.hintColor.withOpacity(0.7)),
                const SizedBox(height: 16),
                Text(
                  l10n.emptyHistoryPlaceholder,
                  style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.swipeDownToRefreshHint, // Ваша новая строка локализации
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // История есть, показываем список
      pageContent = RefreshIndicator(
        onRefresh: _loadFullHistory,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
          itemCount: _history.length,
          itemBuilder: (context, index) { // Используем context из itemBuilder
            final item = _history[index];
            return Card(
              child: Builder( // Обертка для ListTile, чтобы получить его контекст для Share
                builder: (BuildContext tileBuildContext) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    title: Text('${l10n.inputLabel}: ${item.inputSideName} = ${item.inputValue.toStringAsFixed(2)}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${l10n.resultLabel}: A:${item.sideA.toStringAsFixed(2)}, B:${item.sideB.toStringAsFixed(2)}, C:${item.sideC.toStringAsFixed(2)}', style: theme.textTheme.bodyMedium),
                        Text('${l10n.areaLabel}: ${item.area.toStringAsFixed(2)}, ${l10n.perimeterLabel}: ${item.perimeter.toStringAsFixed(2)}', style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 4),
                        Text('${l10n.timeLabel}: ${dateFormat.format(item.timestamp.toLocal())}',
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.share_outlined),
                      tooltip: l10n.shareCalculation,
                      onPressed: () => _shareHistoryItem(tileBuildContext, item),
                    ),
                    isThreeLine: true,
                  );
                }
              ),
            );
          },
        ),
      );
    }

    return Column(
      children: [
        // Кнопка "Очистить историю" показывается только если история не пуста
        // и первоначальная загрузка завершена (чтобы кнопка не мелькала при первой загрузке)
        if (!_isLoading && _history.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: Icon(Icons.delete_sweep_outlined, color: theme.colorScheme.error),
                label: Text(l10n.clearHistoryButton, style: TextStyle(color: theme.colorScheme.error)),
                onPressed: _clearAllHistory,
              ),
            ),
          ),
        Expanded(child: pageContent),
      ],
    );
  }
}