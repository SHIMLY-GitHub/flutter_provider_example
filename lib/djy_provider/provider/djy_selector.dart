import 'package:flutter/material.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier_provider.dart';

class DjySelector<T,R> extends StatelessWidget {

  DjySelector({Key key,this.builder,this.selector,this.shouldRebuild}) : super(key : key);

  final Widget Function(BuildContext context,R value) builder;

  final R      Function(BuildContext context,T value) selector;

  final bool  Function(R oldState, R newState) shouldRebuild;

  Widget oldWidget;
  Widget cache;

  R value;

  @override
  Widget build(BuildContext context) {

   final selected = selector(context, DjyChangeNotifierProvider.of<T>(context));

    var isShouldRebuild = shouldRebuild.call(value,selected);

    if(isShouldRebuild){
      value = selected;
      oldWidget = this;
      cache = builder(
        context,
          selected
      );
    }
    return cache;
  }
}
