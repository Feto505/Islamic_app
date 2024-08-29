import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/settings_provider.dart';
import 'package:provider/provider.dart';
import 'quran.dart';

class SuraDetailsView extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetailsView({super.key});

  @override
  State<SuraDetailsView> createState() => _LayoutviewState();
}

class _LayoutviewState extends State<SuraDetailsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as suraData;
    var provider = Provider.of<SettingsProvider>(context);

    if (versesList.isEmpty) loadQuranData(data.suraIndex);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImage()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "إسلامي",
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 30,
            right: 30,
            bottom: 80,
          ),
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
            bottom: 60,
          ),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? const Color(0xff141a2e).withOpacity(0.8)
                : const Color(0xfff8f8f8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سورة ${data.suraName}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: provider.isDark()
                            ? theme.primaryColor
                            : Colors.black),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.play_circle_fill_outlined,
                      color: provider.isDark()
                          ? theme.primaryColor
                          : Colors.black),
                ],
              ),
              Text(
                "عدد إياتها ${data.suraNumber}",
                style: theme.textTheme.bodySmall,
              ),
              Text(
                "رقم السورة ${data.suraIndex}",
                style: theme.textTheme.bodySmall,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              if (versesList.isEmpty) const Text("No data loaded"),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "${index + 1} ${versesList[index]}",
                      style: theme.textTheme.bodySmall
                      // ?.copyWith(color: provider.isDark()? theme.primaryColorDark:Colors.black)
                      ,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: versesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> versesList = [];

  Future<void> loadQuranData(String suraIndex) async {
    String content = await rootBundle.loadString("assets/files/$suraIndex.txt");
    //print(content);
    versesList = content.split("\n");
    setState(() {});
  }
}
