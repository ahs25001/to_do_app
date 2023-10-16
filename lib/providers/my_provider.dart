import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do/fire_base/fire_base_manager.dart';
import 'package:to_do/models/user_model.dart';

class MyProvider extends ChangeNotifier {
  String local = "ar";
  String mode = "light";
  UserModel? user;
  User? fireBaseUser;

  MyProvider() {
    fireBaseUser = FirebaseAuth.instance.currentUser;
    if (fireBaseUser != null) {
      initUser();
    }
  }

  changeLocal(String code) {
    local = code;
    notifyListeners();
  }

  changeMode(String mode) {
    this.mode = mode;
    notifyListeners();
  }

  initUser() async {
    fireBaseUser = FirebaseAuth.instance.currentUser;
    user = await FireBaseOperations.getUser(fireBaseUser!.uid);
    notifyListeners();
  }
}
