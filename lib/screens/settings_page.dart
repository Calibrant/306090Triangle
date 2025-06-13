import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:triangle_306090/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../providers/theme_provider.dart';
import '../providers/locale_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Сохраняем состояние страницы

  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
      });
    }
  }

  void _showAboutAppDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.aboutApp),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(l10n.appTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(l10n.appDescription), // Добавим описание из локализации
                const SizedBox(height: 8),
                Text(l10n.appDescriptionMoreDetails), // Дополнительное описание
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final l10n = AppLocalizations.of(context)!;
    final Uri uri = Uri.parse(urlString);
    try {
      bool  launched = await launchUrl(uri, mode: LaunchMode.externalApplication); // launchUrl возвращает bool
      if (!launched) {
        // Если launchUrl вернул false, это тоже означает, что не удалось запустить.
        // Это может произойти, если canLaunchUrl вернул true, но сам запуск не удался по другой причине.
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.couldNotLaunchUrl(uri.scheme == 'mailto' ? 'email application' : uri.toString()))),
          );
        }
      }
    } catch (e) {
      // print("Error launching URL: $e for $urlString"); // Для отладки
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.couldNotLaunchUrl(uri.scheme == 'mailto' ? 'email application' : uri.toString()) + ". Error: $e")),
        );
      }
    }
  }

  void _sendFeedbackEmail(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const String email = 'beruni.4a@gmail.com'; // ЗАМЕНИТЕ НА ВАШ EMAIL
    final String subject =
        Uri.encodeComponent('Feedback for ${l10n.appTitle} - v$_appVersion');
    final String body = Uri.encodeComponent(
        '\n\n\n----------------\nApp Version: $_appVersion\nDevice: (please specify if relevant)\nOS: (please specify if relevant)');

    final Uri mailUri = Uri.parse('mailto:$email?subject=$subject&body=$body');
    _launchURL(context, mailUri.toString());
  }

  void _shareApp(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Замените на вашу ссылку на приложение в магазинах или на веб-сайт
    const String appStoreLink =
        'https://apps.apple.com/app/com.fantazey.triangle_306090'; // Пример для App Store
    const String playStoreLink =
        'https://play.google.com/store/apps/details?id=com.fantazey.triangle_306090'; // Пример для Google Play

    // Можно выбрать ссылку в зависимости от платформы или дать обе
    final String shareText =
        '${l10n.appTitle}\n$playStoreLink'; // Упрощенный вариант

    final box = context.findRenderObject() as RenderBox?;
    SharePlus.instance.share(ShareParams(
      text: shareText,
      subject: l10n.shareApp,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Важно для AutomaticKeepAliveClientMixin
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context); // Получаем тему для стилей

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: <Widget>[
        _buildSectionTitle(context, l10n.appearanceSectionTitle),
        ListTile(
          leading: const Icon(Icons.brightness_6_outlined),
          title: Text(l10n.themeSettingTitle),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<ThemeMode>(
              value: themeProvider.themeMode,
              items: [
                DropdownMenuItem(
                    value: ThemeMode.light, child: Text(l10n.lightTheme)),
                DropdownMenuItem(
                    value: ThemeMode.dark, child: Text(l10n.darkTheme)),
                DropdownMenuItem(
                    value: ThemeMode.system, child: Text(l10n.systemTheme)),
              ],
              onChanged: (ThemeMode? newMode) {
                if (newMode != null) {
                  themeProvider.setTheme(newMode);
                }
              },
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.language_outlined),
          title: Text(l10n.languageSettingTitle),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<Locale?>(
              value: localeProvider.locale,
              hint:
                  Text(l10n.systemLanguage), // Показывается, если value is null
              items: [
                DropdownMenuItem<Locale?>(
                  value: null, // null для системного языка
                  child: Text(localeProvider.getLanguageDisplayName(
                      context, null)), // "Системный по умолчанию"
                ),
                ...LocaleProvider.supportedLocalesList.map((supportedLocale) {
                  return DropdownMenuItem<Locale?>(
                    value: supportedLocale,
                    child: Text(localeProvider.getLanguageDisplayName(
                        context, supportedLocale)),
                  );
                }).toList(),
              ],
              onChanged: (Locale? newLocale) {
                localeProvider.setLocale(newLocale);
              },
            ),
          ),
        ),
        const Divider(height: 24),
        _buildSectionTitle(context, l10n.aboutSectionTitle),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(l10n.aboutApp),
          onTap: () => _showAboutAppDialog(context, l10n),
        ),
        ListTile(
          leading: const Icon(Icons.feedback_outlined),
          title: Text(l10n.feedback),
          onTap: () => _sendFeedbackEmail(context), // Используем новую функцию
        ),
        ListTile(
          leading: const Icon(Icons.share_outlined),
          title: Text(l10n.shareApp),
          onTap: () => _shareApp(context),
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip_outlined),
          title: Text(l10n.privacyPolicy),
          onTap: () => _launchURL(context,
              'https://fantazeyapp.github.io/privacy.html'), // ЗАМЕНИТЕ URL НА ВАШУ ПОЛИТИКУ
        ),
        if (_appVersion.isNotEmpty) // Перемещенный ListTile для версии
          ListTile(
            leading: const Icon(Icons.verified_outlined), // Иконка для версии
            title: Text(l10n.version), // Локализованное слово "Версия"
            trailing: Text(_appVersion,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.hintColor)), // Сам номер версии
            // onTap: () {}, // Можно сделать тап для копирования версии, если нужно
          ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title.toUpperCase(), // Для стиля заголовка секции
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 0.8,
            ),
      ),
    );
  }
}
