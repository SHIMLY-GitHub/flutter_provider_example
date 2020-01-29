import 'package:flutter/material.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier_provider.dart';
class DjyConsumer<T> extends StatelessWidget {
  DjyConsumer({Key key,this.child,@required this.builder}) : super(key: key);

  final Widget child;
  final Widget Function(BuildContext context,T value) builder;
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
        DjyChangeNotifierProvider.of<T>(context)
    );
  }
}
