import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_notifier_value_provider_page.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_state.dart';
class ChangeNotoifiterProvider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_)=>ChangeState(),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ChangeNotifityProvider的用法"),
        ),

        body: Center(

            child: Consumer<ChangeState>(
              builder: (context,changeState,_){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "${changeState.count}",
                        style: Theme.of(context).textTheme.display1
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
    print("重构build");
    return FloatingActionButton(
      onPressed: () {

       Provider.of<ChangeState>(context,listen: true).add();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
