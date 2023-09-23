import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier{
  String local="en";
  String mode="dark";
  changeLocal(String code){
    local=code;
    notifyListeners();
  }
  changeMode(String mode){
    this.mode=mode;
    notifyListeners();
  }
}