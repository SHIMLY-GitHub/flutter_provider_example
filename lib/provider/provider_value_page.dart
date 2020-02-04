import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/cart_state.dart';
import 'package:provider/provider.dart';


class ProviderValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value(

      value: 12,
      updateShouldNotify: (previous, next){


        return previous != next;
      } ,

      child: Scaffold(
        appBar: AppBar(title: Text("provider value的用法"),),
        body: Builder(builder: (context){
          return Center(
            child: Text("provider.value = ${Provider.of<int>(context)}"),
          );
        }),
        floatingActionButton: IncrementCounterButton(),
      ),


    );
  }


}
class IncrementCounterButton extends StatelessWidget {
  const IncrementCounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: () {



        Provider.of<CartState>(context,listen: false).add();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
