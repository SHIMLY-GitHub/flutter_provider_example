import 'package:flutter/material.dart';


import 'package:flutter_provider_example/djy_provider/my_car_state.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier_provider.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_consumer.dart';

class MyCarPage extends StatefulWidget {
  @override
  _MyCarPageState createState() => _MyCarPageState();
}

class _MyCarPageState extends State<MyCarPage> {
  @override
  Widget build(BuildContext context) {

    return DjyChangeNotifierProvider<MyCarState>(
      data: MyCarState(),
      child: Scaffold(
        appBar: AppBar(title: Text("这是自定义proivder实现"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

               DjyConsumer<MyCarState>(

                 builder: (context,mystate){
                   print("text1 重绘");
                   return Text(
                     "${mystate.count1}",
                     style: Theme.of(context).textTheme.display2,
                   );
                 },

               ),
              DjyConsumer<MyCarState>(
                builder: (context,mystate){
                  print("text2 重绘");
                  return Text(
                    "${mystate.count2}",
                    style: Theme.of(context).textTheme.display2,
                  );
                },

              ),

              Builder(builder: (context){

                return Text(

                  "${DjyChangeNotifierProvider.of<MyCarState>(context).count1}",

                  style: Theme.of(context).textTheme.display1,
                );
              })
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
    print(" IncrementCounterButton 重新buid");
    return FloatingActionButton(
      onPressed: () {
       DjyChangeNotifierProvider.of<MyCarState>(context,listen: false).add1();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
