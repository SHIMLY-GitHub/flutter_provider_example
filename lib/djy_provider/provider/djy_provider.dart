import 'package:flutter/material.dart';

class DjyProvider<T> extends InheritedWidget{
  DjyProvider({
    @required this.data,

    Widget child

  }) : super(child:child);

   final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //每次更新都会调用其子节点的 didChangeDependencies
    return true;
  }
}
