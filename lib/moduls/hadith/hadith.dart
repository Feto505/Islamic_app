import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/moduls/hadith/hadith_details_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    if (hadithDataList.isEmpty) loadHadithData();
    var theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/body/hadith_body.png",
            scale: 1,
          ),
          const Divider(),
          Text(
            "${lang.hadith_name}",
            style: theme.textTheme.bodyLarge,
          ),
          const Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: hadithDataList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadithDetailsView.routeName,
                    arguments: hadithDataList[index],
                  );
                },
                child: Text(
                  hadithDataList[index].title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(height: 1.8),
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  Future<void> loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadithDataList = content.split("#");
    for (int i = 0; i < allHadithDataList.length; i++) {
      //print(allHadithDataList[i]);
      String singleHadithData = allHadithDataList[i].trim(); //trim empty spase
      int indexLength = singleHadithData.indexOf("\n");
      String title = singleHadithData.substring(0, indexLength);
      // print(title);

      String bodyContent = singleHadithData.substring(indexLength + 1);
      // print("hi $bodyContent");
      HadithData hadithData =
          HadithData(title: title, bodyContent: bodyContent);
      hadithDataList.add(hadithData);
      setState(() {});
    }
  }
}

class HadithData {
  final String title;
  final String bodyContent;

  HadithData({required this.title, required this.bodyContent});
}
