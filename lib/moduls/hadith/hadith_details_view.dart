import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';
import 'hadith.dart';

class HadithDetailsView extends StatelessWidget {
  static const String routeName = "HadithDetails";

  const HadithDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadithData;
    var provider = Provider.of<SettingsProvider>(context);

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
                ? Color(0xff141a2e).withOpacity(0.8)
                : Color(0xfff8f8f8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                data.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: provider.isDark()
                        ? theme.primaryColorDark
                        : Colors.black),
              ),

              // Text("عدد إياتها ${data.suraNumber}", style: theme.textTheme.bodySmall,),
              // Text("رقم السورة ${data.suraIndex}", style: theme.textTheme.bodySmall,),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.bodyContent,
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: provider.isDark()
                              ? theme.primaryColorDark
                              : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
