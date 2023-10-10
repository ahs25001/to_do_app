import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/homeLayout.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/styles/myThem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/tabs/login/loginAndSinUpScreen.dart';
import 'package:to_do/tabs/update/update.dart';
import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return MyProvider();
  },
  child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale(provider.local),
      themeMode: (provider.mode=="light")?ThemeMode.light:ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThem.light,
      darkTheme: MyThem.dark,
      routes: {
        HomeLayout.routName:(context) => HomeLayout(),
        UpDateScreen.routName:(context) => UpDateScreen(),
        LoginAndSinUppScreen.routName:(context) => LoginAndSinUppScreen()
      },
      initialRoute: LoginAndSinUppScreen.routName,
      debugShowCheckedModeBanner: false,
    );
  }
}
