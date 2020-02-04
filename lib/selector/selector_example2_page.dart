import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/selector/selector_state.dart';

class SelectorExample2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectorState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("selector"),
        ),
        body: Center(
          child: Column(
            // bool Function(T previous, T next);
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Selector(builder: (context,count1,child){
                print("text1被重绘");
                return Text(
                    "text1======" + "${count1}",
                    style: Theme.of(context).textTheme.display1
                );
              }, selector: (BuildContext context, SelectorState state){
                print("text1的selector执行");
                 return state.count1;
              },shouldRebuild: (previous,next){
                ///用来从外部指定 当关联状态没有变化的时候 是否需要重绘
                ///默认情况下 previous!= next 也许在某些情况下 需要自定义返回结果 比如previous.customObject1 !=  next.customObject1
                ///必须具备可比较性
                return previous != next;
              },),

              Selector(builder: (context,count2,child){
                print("text2被重绘");
                return Text(
                    "text2======" + "${count2}",
                    style: Theme.of(context).textTheme.display1
                );
              }, selector: (BuildContext context, SelectorState state){
                return state.count2;
              }),
              Selector(builder: (context,count3,child){
                print("text3被重绘");
                return Text(
                    "text3======" + "${count3}",
                    style: Theme.of(context).textTheme.display1
                );
              }, selector: (BuildContext context, SelectorState state){
                return state.count3;
              }),

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

        Provider.of<SelectorState>(context,listen: false).add1();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
