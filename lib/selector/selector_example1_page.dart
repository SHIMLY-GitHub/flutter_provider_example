import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/selector/selector_state.dart';
import 'package:flutter_provider_example/selector/selector_example2_page.dart';
class SelectorExample1Page extends StatelessWidget {

  /// 注意以下代码的问题
  /// 1.当点击右下角的按钮 执行 add1()的操作以后 text1 text2 text3 都被重绘
  /// 2.此时的重绘text2 text3 是毫无意义的, 这样在真实项目中如果 text1 text2是比较复杂的子控件
  /// 那么 将毫无意义的损耗了性能
  /// 3.我们期望的结果是 执行 add1() 更新 text1 执行add2() 更新text2.....
  /// 4.为了解决这个问题 provider提供了 selector 的办法 请看 selector_example2_page

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<SelectorState>(builder: (context, state, widget) {
                print("text1重绘");
                return Text(
                  "text1=====" + "${state.count1}",
                    style: Theme.of(context).textTheme.display1
                );
              }),
              Consumer<SelectorState>(builder: (context, state, widget) {
                print("text2重绘");
                return Text(
                    "text2======" + "${state.count2}",
                    style: Theme.of(context).textTheme.display1
                );
              }),
              Consumer<SelectorState>(builder: (context, state, widget) {
                print("text3重绘");
                return Text(
                    "text3======" + "${state.count2}",
                    style: Theme.of(context).textTheme.display1
                );
              }),
              GestureDetector(
                child: Text("点击跳转 selector_example2_page"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return SelectorExample2Page();
                  }));
                },
              )

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
