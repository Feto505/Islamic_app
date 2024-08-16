import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> _languages = ["English", "عربي"];
  List<String> _themes = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    //var provider= SettingsProvider();
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            lang.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            items: _languages,
            //============??????????????????????????????????????
            initialItem: provider.currentLanguage == "en"
                ? _languages[0]
                : _languages[1],
            onChanged: (value) {
              if (value == "English") {
                provider.changeCurrentLanguage("en");
              }
              if (value == "عربي") {
                provider.changeCurrentLanguage("ar");
              }
              log("Changing value to: $value");
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? Color(0xff141a2e) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? Color(0xff141a2e) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            lang.theme_mode,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            items: _themes,
            initialItem: provider.currentTheme == ThemeMode.light
                ? _themes[0]
                : _themes[1],
            onChanged: (value) {
              if (value == "Light") {
                provider.changeCurrentTheme(ThemeMode.light);
              }
              if (value == "Dark") {
                provider.changeCurrentTheme(ThemeMode.dark);
              }
              log("Changing value to: $value");
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? Color(0xff141a2e) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? Color(0xff141a2e) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
