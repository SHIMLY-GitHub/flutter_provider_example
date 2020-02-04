import 'package:flutter/material.dart';

class MultiState1 extends ChangeNotifier{

  get desc => "这是MultiState1";


}

class MultiState2 extends ChangeNotifier{

  get desc => "这是MultiState2";

}

class MultiState3 extends ChangeNotifier{

  int _count = 0;
  get count => _count;

  void add(){
    _count ++;
    notifyListeners();
  }

}