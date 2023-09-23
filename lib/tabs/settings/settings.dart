import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/tabs/settings/bottom_sheet/language_bottom_sheet.dart';

import '../../providers/my_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: primary),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              openLanguageSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: primary, width: 3),
                  borderRadius: BorderRadius.circular(23)),
              child: Text(
                (provider.local == "en")
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: primary)),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: primary, width: 3),
                  borderRadius: BorderRadius.circular(23)),
              child: Text(AppLocalizations.of(context)!.light))
        ],
      ),
    );
  }

  openLanguageSheet(){
    showModalBottomSheet(context: context, builder: (context){
      return LanguageBottomSheet();
    });
  }
}
