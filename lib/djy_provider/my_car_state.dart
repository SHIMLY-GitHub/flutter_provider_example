import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier.dart';

class MyCarState extends DjyChangeNotifier{
  int _count = 0;

  get count=> _count;

  void add(){
    _count ++;
    notifyListeners();
  }

}