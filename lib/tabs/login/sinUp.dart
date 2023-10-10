import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if(!emailValid){
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
                          color: (hidden) ? Colors.white70 : primary,
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
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.sinUp),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.login)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}