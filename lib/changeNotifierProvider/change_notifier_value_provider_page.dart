import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_state.dart';

class ChangeNotifierValueProviderPage extends StatefulWidget {
  ChangeState changeState;
  ChangeNotifierValueProviderPage({Key key,this.changeState}) : super(key : key);
  @override
  _ChangeNotifierValueProviderPageState createState() => _ChangeNotifierValueProviderPageState();
}

class _ChangeNotifierValueProviderPageState extends State<ChangeNotifierValueProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: widget.changeState,

        child: Scaffold(
          appBar: AppBar(title: Text("value"),),
          body: Center(
            child: Consumer<ChangeState>(
              builder: (context,changeStage,_){
                return Text("${changeStage.count}",style:  Theme.of(context).textTheme.display1);
              },
            )
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
