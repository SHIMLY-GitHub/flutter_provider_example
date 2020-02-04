import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier.dart';

class MyCarState extends DjyChangeNotifier{
  int _count1 = 0;
  int _count2 = 0;

  get count1=> _count1;

  get count2=> _count2;

  void add1(){
    _count1 ++;
    notifyListeners();
  }
  void add2(){
    _count2 ++;
    notifyListeners();
  }

}