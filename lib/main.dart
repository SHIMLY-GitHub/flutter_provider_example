import 'package:flutter/material.dart';
import 'package:flutter_provider_example/provider/provier_create_page.dart';
import 'package:flutter_provider_example/provider/provider_value_page.dart';
import 'package:flutter_provider_example/changeNotifierProvider/change_notifier_provider_page.dart';
import 'package:flutter_provider_example/future_provider/future_provider_page.dart';

import 'package:flutter_provider_example/djy_provider/my_car_page.dart';
import 'package:flutter_provider_example/multiProvider/multiProvider_page.dart';
import 'package:flutter_provider_example/selector/selector_example1_page.dart';
import 'package:flutter_provider_example/proxyProvider/proxy_provider_page.dart';
import 'package:provider/provider.dart';


void main() {

  Provider.debugCheckInvalidValueType = null;

  Widget app = MyApp();


  runApp(app);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget w =  MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );


    return  w;

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return ProviderCreatePage();
                }));

              },
              child: Text("provide create 的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return ProviderValuePage();
                }));

              },
              child: Text("provide value 的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return ChangeNotoifiterProvider();
                }));

              },
              child: Text("ChangeNotifierProvider 的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return SelectorExample1Page();
                }));
              },
              child: Text("selector的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return ProxyProviderPage();
                }));
              },
              child: Text("proxyProvider"),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return MultiProviderPage();
                }));

              },
              child: Text("MultiProvider 的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return FutureProviderPage();
                }));

              },
              child: Text("FutureProviderPage 的用法"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return MyCarPage();
                }));

              },
              child: Text("模拟provider的实现原理"),
            )
          ],
        ),
      ),

    );
  }
}
