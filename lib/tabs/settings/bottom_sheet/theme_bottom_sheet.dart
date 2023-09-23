import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/colors.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeMode("light");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style:(provider.mode == "light")? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primary):Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                (provider.mode == "light") ? Icon(Icons.done) : SizedBox()
              ],
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              provider.changeMode("dark");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style:(provider.mode == "dark")? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primary):Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                (provider.mode== "dark") ? Icon(Icons.done) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
