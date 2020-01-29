import 'package:flutter/material.dart';
typedef VoidCallback = void Function();


///这其实就一个数组 把需要的那个状态对应的 方法 装进数组 在执行 notifyListeners 的时候 执行
///这个方法 从而达到更改状态的目的

class DjyChangeNotifier implements Listenable{

  List<VoidCallback> _list = List();

  @override
  void addListener(listener) {
    // TODO: implement addListener
    _list.add(listener);
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
    _list.remove(listener);
  }


  void notifyListeners(){
    for (int i=0 ;i <_list.length; i++){
      VoidCallback call = _list[i];
      call();
    }
  }

}