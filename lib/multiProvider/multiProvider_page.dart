import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_example/multiProvider/multi_state.dart';

class MultiProviderPage extends StatefulWidget {
  @override
  _MultiProviderPageState createState() => _MultiProviderPageState();
}

class _MultiProviderPageState extends State<MultiProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider<MultiState1>(create: (_)=>MultiState1()),

        Provider<MultiState2>(create: (_)=>MultiState2()),

        ChangeNotifierProvider<MultiState3>(create: (_)=>MultiState3())

      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("MultiProvider的用法"),
        ),
        body: Center(

          child: Consumer3<MultiState1,MultiState2,MultiState3>(
            builder: (context,state1,state2,state3,widget){
              return Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state1.desc,style: Theme.of(context).textTheme.display1),
                  Text(state2.desc,style: Theme.of(context).textTheme.display1),
                  Text("${state3.count}",style: Theme.of(context).textTheme.display1)
                ],
              );
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
    print("重构build");
    return FloatingActionButton(
      onPressed: () {

        Provider.of<MultiState3>(context,listen: false).add();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
