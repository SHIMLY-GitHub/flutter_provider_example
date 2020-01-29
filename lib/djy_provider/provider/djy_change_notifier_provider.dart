import 'package:flutter/material.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_provider.dart';


class DjyChangeNotifierProvider<T extends DjyChangeNotifier> extends StatefulWidget {

  DjyChangeNotifierProvider({
    Key key,
    this.data,
    this.child
  }
      );
  final T data;
  final Widget child;


  //用于 子节点中的 widget 获取数据
  static T of<T>(BuildContext context,{bool listen = true}){


    if(listen == true){

      final provider =  context.dependOnInheritedWidgetOfExactType<DjyProvider<T>>();

      return provider.data;
    }

    final  provider = context.getElementForInheritedWidgetOfExactType<DjyProvider<T>>()?.widget as DjyProvider<T>;

    return provider.data;
  }

  @override
  _DjyChangeNotifierProviderState createState() => _DjyChangeNotifierProviderState<T>();
}

class _DjyChangeNotifierProviderState<T extends DjyChangeNotifier> extends State<DjyChangeNotifierProvider<T>> {



  void update(){
    setState(() {


    });
  }

  @override
  void didUpdateWidget(DjyChangeNotifierProvider<T> oldWidget) {
    // TODO: implement didUpdateWidget

    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }

    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    // TODO: implement initState
    widget.data.addListener(update);
    super.initState();

    
  }
  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DjyProvider<T>(
        data:widget.data,
        child:widget.child
    );
  }
}
