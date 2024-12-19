import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/settings/language.dart';
import 'package:news_app/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            margin: const EdgeInsets.only(left: 18),
            padding: const EdgeInsets.all(17),
            width: width * 0.7,
            height: height * 0.067,
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primary),
                color: AppTheme.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Language>(
                  value: languages.firstWhere((language) =>
                      language.code == settingsProvider.languageCode),
                  items: languages
                      .map((language) => DropdownMenuItem<Language>(
                          value: language,
                          child: Text(
                            language.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppTheme.primary),
                          )))
                      .toList(),
                  onChanged: (selectedlanguage) {
                    if (selectedlanguage != null) {
                      settingsProvider.changeLanguage(selectedlanguage.code);
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
