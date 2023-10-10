import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/tabs/login/login.dart';
import 'package:to_do/tabs/login/sinUp.dart';

class LoginAndSinUppScreen extends StatelessWidget {
  static const String routName = "login";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.login),
          bottom:
              TabBar(labelStyle: Theme.of(context).textTheme.bodySmall, tabs: [
            Tab(
              text: AppLocalizations.of(context)!.login,
            ),
            Tab(
              text: AppLocalizations.of(context)!.sinUp,
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Login(),
            SinUp(),
          ],
        ),
      ),
    );
  }
}
