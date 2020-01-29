import 'package:flutter/material.dart';

class CartState {


  int _count = 13;

  get count=>_count;

  void add(){
    _count = _count +1;

  }
}
