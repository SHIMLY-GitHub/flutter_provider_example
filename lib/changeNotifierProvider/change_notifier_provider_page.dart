import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_notifier_value_provider_page.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_state.dart';
class ChangeNotoifiterProvider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("重构build");
    return ChangeNotifierProvider(
      create: (_)=>ChangeState(),

      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ChangeNotifityProvider的用法"),
        ),

        body: Center(

            child: Consumer<ChangeState>(
              builder: (context,changeState,widget){


                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "${changeState.count}",
                        style: Theme.of(context).textTheme.display1
                    ),

                    GestureDetector(
                      onTap: (){
                        changeState.add();
                      },
                      child: Text("点击数字+1"),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                          return ChangeNotifierValueProviderPage(
                            changeState: changeState,
                          );
                        }));
                      },
                      child: Text("点击push下一个页面"),
                    )
                  ],

                );
              },
              child: Text("世界你好"),

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

       Provider.of<ChangeState>(context,listen: false).add();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
