import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/layout/homeLayout.dart';
import 'package:to_do/providers/my_provider.dart';

import '../../models/task_Model.dart';
import '../../styles/colors.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.enterEmail;
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return AppLocalizations.of(context)!.enterValidMail;
                }
                return null;
              },
              controller: mailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  label: Text(AppLocalizations.of(context)!.enterEmail)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.enterPassword;
                }
                return null;
              },
              controller: passwordController,
              obscureText: hidden,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        hidden = !hidden;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: (hidden)
                            ? Theme.of(context).colorScheme.onPrimary
                            : primary,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide(color: primary)),
                  label: Text(AppLocalizations.of(context)!.enterPassword)),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                    FireBaseOperations.login(
                        mailController.text, passwordController.text, () {
                      provider.initUser();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeLayout.routName,
                        (route) => false,
                      );
                    }, onError);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onError),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.login,
                      color: Theme.of(context).colorScheme.onError,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  onError(String error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Ok"))
      ], title: const Text("Error"), content: Text(error)),
    );
  }
}
