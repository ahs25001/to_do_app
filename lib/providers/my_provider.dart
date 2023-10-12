import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier{
  String local="en";
  String mode="dark";
  changeLocal(String code){
    local=code;
    notifyListeners();
    print (local);
    print('----------------');

  }
  changeMode(String mode){
    this.mode=mode;
    notifyListeners();
  }
}