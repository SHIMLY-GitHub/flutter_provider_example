import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {


  int _count = 13;

  get count=>_count;

  void add(){
    _count = _count +1;

  }
}
