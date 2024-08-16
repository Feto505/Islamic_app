import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/core/settings_provider.dart';
import 'package:islamic_app/moduls/hadith/hadith.dart';
import 'package:islamic_app/moduls/quran/quran.dart';
import 'package:islamic_app/moduls/radio/radio.dart';
import 'package:islamic_app/moduls/sebha/sebha.dart';
import 'package:islamic_app/moduls/settings/settings.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';

class Layoutview extends StatefulWidget {
  static const String routeName = "layoutview";

  const Layoutview({super.key});

  @override
  State<Layoutview> createState() => _LayoutviewState();
}

class _LayoutviewState extends State<Layoutview> {
  int selectedIndex = 0;

  List<Widget> ScreensList = [
    const QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          //error cuz const word
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImage()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.islami,
          ),
          centerTitle: true,
        ),
        body: ScreensList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage("assets/images/icons/quran.png")),
                label: lang.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage("assets/images/icons/hadith.png")),
                label: lang.hadith),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage("assets/images/icons/sebha.png")),
                label: lang.tasbeh),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage("assets/images/icons/radio.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: lang.sittings),
          ],
        ),
      ),
    );
  }
}
