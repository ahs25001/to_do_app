import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/styles/colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLocal("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style:(provider.local == "ar")? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primary):Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                (provider.local == "ar") ? Icon(Icons.done) : SizedBox()
              ],
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              provider.changeLocal("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style:(provider.local == "en")? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primary):Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                (provider.local == "en") ? Icon(Icons.done) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
