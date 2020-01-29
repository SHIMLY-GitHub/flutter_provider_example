import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/cart_state.dart';
import 'package:provider/provider.dart';
class ProviderValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CartState>.value(

      value: CartState(),
      child: Scaffold(
        appBar: AppBar(title: Text("provider value的用法"),),
        body: Builder(builder: (context){
          return Center(
            child: Text("provider.value = ${Provider.of<CartState>(context).count}"),
          );
        }),
      ),
    );
  }
}
