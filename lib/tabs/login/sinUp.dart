import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/tabs/login/loginAndSinUpScreen.dart';

import '../../styles/colors.dart';

class SinUp extends StatefulWidget {
  @override
  State<SinUp> createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {
  var mailController = TextEditingController();

  var nameController = TextEditingController();

  var ageController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: 18.0,
            left: 18,
            right: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.enterName;
                  }
                  return null;
                },
                controller: nameController,
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
                    label: Text(AppLocalizations.of(context)!.enterName)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.enterAge;
                  }
                  return null;
                },
                controller: ageController,
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
                    label: Text(AppLocalizations.of(context)!.enterAge)),
              ),
              const SizedBox(
                height: 20,
              ),
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
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      );
                      FireBaseOperations.createAccount(
                          email: mailController.text,
                          password: passwordController.text,
                          onSuccess: onSuccess,
                          onError: onError,
                          name: nameController.text,
                          age: int.parse(ageController.text));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.sinUp,
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
      ),
    );
  }

  onSuccess() {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginAndSinUppScreen.routName, (route) => false);
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
