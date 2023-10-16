import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/tabs/settings/bottom_sheet/language_bottom_sheet.dart';
import 'package:to_do/tabs/settings/bottom_sheet/theme_bottom_sheet.dart';

import '../../providers/my_provider.dart';
import '../login/loginAndSinUpScreen.dart';

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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: primary, width: 3),
                borderRadius: BorderRadius.circular(23)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${provider.user!.firstName} ${provider.user!.lastName}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  provider.user!.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primary),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: primary),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              openLanguageSheet();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: primary, width: 3),
                  borderRadius: BorderRadius.circular(23)),
              child: Text(
                (provider.local == "en")
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: primary)),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              openThemeSheet();
            },
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: primary, width: 3),
                    borderRadius: BorderRadius.circular(23)),
                child: Text(
                  (provider.mode == "light")
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23))),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginAndSinUppScreen.routName, (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.logOut,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onError),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.onError,
                  )
                ],
              )),
        ],
      ),
    );
  }

  openLanguageSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LanguageBottomSheet();
        });
  }

  openThemeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeSheet();
        });
  }
}
