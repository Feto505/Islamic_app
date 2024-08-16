import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/settings_provider.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  List<String> AzkarList = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
  ];
  int counter = 0;
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = SettingsProvider();
    //var mediaQuery = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context); //the same work of mediaQuery
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            //clipBehavior: Clip.antiAliasWithSaveLayer,//show only the size of...<cut>
            alignment: Alignment.topCenter,
            children: [
              Image.asset(provider.isDark()
                  ? "assets/images/body/head_sebha_dark.png"
                  : "assets/images/body/head_sebha_light.png"),
              InkWell(
                onTap: () {
                  onZekrClick();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(provider.isDark()
                          ? "assets/images/body/body_sebha_dark.png"
                          : "assets/images/body/sebha_body.png")),
                ),
              ),
            ],
          ),
          // SizedBox(height: size.height *0.08,),

          Text(lang.tasbehat_number),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.primaryColor.withOpacity(0.7)),
            child: Text("$counter"),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: theme.primaryColor),
              child: Text(AzkarList[index]),
            ),
            onTap: () {
              onZekrClick();
            },
          ),
        ],
      ),
    );
  }

  onZekrClick() {
    // counter++;
    angle += 0.5;
    setState(() {});
    if (counter < 33) {
      counter++;
    } else {
      counter = 0;
      index++;
      if (index == 3) {
        index = 0;
      }
    }
  }
}
