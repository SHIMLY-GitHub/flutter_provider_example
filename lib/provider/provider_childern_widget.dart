import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/provider/cart_state.dart';
class ProviderChildernWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("${ Provider.of<CartState>(context).count}",style: TextStyle(color: Colors.red),);
  }
}

class Proter extends StatefulWidget {
  @override
  _ProterState createState() => _ProterState();
}

class _ProterState extends State<Proter> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
