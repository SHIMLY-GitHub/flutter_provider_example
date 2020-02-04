import 'package:flutter/material.dart';


import 'package:flutter_provider_example/djy_provider/my_car_state.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_change_notifier_provider.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_consumer.dart';
import 'package:flutter_provider_example/djy_provider/provider/djy_selector.dart';
class MyCarPage extends StatefulWidget {
  @override
  _MyCarPageState createState() => _MyCarPageState();
}

class _MyCarPageState extends State<MyCarPage> {
  /// 使用DjyConsumer 存在的问题就是 当text1重绘的时候 text2也重绘了 这样就出现了无意义的build
  /// 可以使用 DjySelector 解决上面出现的问题，根据自己的业务参数比如例子中的 count1和count2
  /// 来控制是否需要重新build 
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

              DjySelector<MyCarState,int>(
                builder: (context,count1){
                  print("text1重绘");
                  return Text(
                   "text1========"+"${count1}",
                    style: Theme.of(context).textTheme.display2);
                },
                selector: (BuildContext context,MyCarState state){
                  return state.count1;
                },
                shouldRebuild: (int oldState,int newState){
                  return oldState != newState;
                },

              ),
              DjySelector<MyCarState,int>(
                builder: (context,count2){
                  print("text2重绘");
                  return Text(
                      "text2====="+"${count2}",
                      style: Theme.of(context).textTheme.display2);
                },
                selector: (BuildContext context,MyCarState state){
                  return state.count2;
                },
                shouldRebuild: (int oldState,int newState){
                  return oldState != newState;
                },

              ),
               /*
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
              */

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
