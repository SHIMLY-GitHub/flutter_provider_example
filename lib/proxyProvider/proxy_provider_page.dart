import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/proxyProvider/proxy_state.dart';
class ProxyProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// ProxyProvider0 用create 创建的对象 会被update 覆盖
    int count = 23;
    return ProxyProvider0<ProxyState>(

      update: (context,state){

        return ProxyState(count);
      },


      child: Scaffold(
        appBar: AppBar(
          title: Text("ProxyProvider的用法"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context){
                  return Text("${Provider.of<ProxyState>(context).count}",style: Theme.of(context).textTheme.display2,);

                },
              )
            ],
          ),
        ),
        floatingActionButton:FloatingActionButton(
          onPressed: () {

              count = count ++;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
      ),
    );
  }
}
