import 'package:flutter/material.dart';
class SelectorState extends ChangeNotifier{

  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;

  get count1=>_count1;
  get count2=>_count2;
  get count3=>_count3;


  void add1(){
    _count1++;
    notifyListeners();
  }

  void add2(){
    _count2 ++;
    notifyListeners();
  }
}