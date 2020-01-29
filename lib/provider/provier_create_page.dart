import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/provider/cart_state.dart';
import 'package:flutter_provider_example/provider/provider_childern_widget.dart';


class ProviderCreatePage extends StatelessWidget {

  /// 1.Provider 这个类 只能创建 不可变的state


  @override
  Widget build(BuildContext context) {


    return Provider<CartState>(
      create:(context){

        return CartState();

      },


      child: Scaffold(
        appBar: AppBar(title: Text("provider的用法"),),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("这是基本的provider",style: Theme.of(context).textTheme.display1,),
              Builder(builder: (context){

                return  Text(
                    "${Provider.of<CartState>(context).count}",
                    style: Theme.of(context).textTheme.display1,
                );
              }),

              ProviderChildernWidget()

            ],
          ),
        ),

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

      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}