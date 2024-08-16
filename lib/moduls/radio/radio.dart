import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/settings_provider.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Spacer(),
        Image.asset("assets/images/body/radio_body.png"),
        SizedBox(
          height: 30,
        ),
        Text(
          "${lang.quran_radio}",
          style: theme.textTheme.bodyLarge?.copyWith(
              color: provider.isDark() ? Colors.white : Colors.black),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.play_arrow,
                size: 40,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.play_arrow,
                size: 60,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.play_arrow,
                size: 40,
                color: theme.primaryColor,
              )
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
