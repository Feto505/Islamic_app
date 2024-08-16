import 'package:flutter/material.dart';
import 'package:islamic_app/moduls/quran/quran.dart';

class SuraTitleWidget extends StatelessWidget {
  const SuraTitleWidget({
    super.key,
    required this.data,
  });

  final suraData data;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: Text(data.suraIndex,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center)),
        const SizedBox(
          height: 40,
          child: VerticalDivider(),
        ),
        Expanded(
            child: Text(data.suraName,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center)),
        const SizedBox(
          height: 40,
          child: VerticalDivider(),
        ),
        Expanded(
            child: Text(
          data.suraNumber,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
