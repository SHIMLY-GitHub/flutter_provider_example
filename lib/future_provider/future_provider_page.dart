import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

const TRAVEL_LIST_URL = "https://mapi.mafengwo.cn/sales/home/get_index/v2?jsondata=%7B%22page%22%3A%7B%22num%22%3A15%2C%22boundary%22%3A%221%22%7D%7D&o_lat=39.904542&device_type=android&dev_ver=D1932.0&oauth_version=1.0&oauth_signature_method=HMAC-SHA1&screen_height=2029&open_udid=64774894b98b2cc4&app_version_code=815&x_auth_mode=client_auth&oauth_token=0_0969044fd4edf59957f4a39bce9200c6&sys_ver=9&o_lng=116.443449&brand=Xiaomi&zzzghostsigh=521deb149b9e7d14de0029a4c0f9ed977b9b7d0a&app_code=com.mfw.roadbook&android_oaid=1bb9aee3d819ec37&screen_scale=2.88&screen_width=1080&time_offset=480&device_id=64774894b98b2cc4&oauth_signature=ZHFSuE7TVZR3C1adlOeiWEeqM3o%3D&oauth_consumer_key=5&oauth_timestamp=1573707738&oauth_nonce=a2b32230-f138-4db8-bacc-11995a9ddd35&mfwsdk_ver=20140507&app_ver=9.3.34&has_notch=1&hardware_model=MI+8+SE&channel_id=XiaoMi&";

class CustomState{

  int _count = 2;


  Future<int> doSomeHttpRequest() async {
    final response = await Dio().get(TRAVEL_LIST_URL);
    if(response.statusCode == 200){

      return 23;
    }else{

      Exception("请求失败");

    }

  }

}

class FutureProviderPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("futureProvider 用法"),
      ),

      body: FutureProvider<int>(
          create: (_) async =>CustomState().doSomeHttpRequest(),
          child: Center(
            child: Builder(
              builder: (context){
                return Text("${Provider.of<int>(context)}",  style: Theme.of(context).textTheme.display1);
              },
            )
          ),
      ),
    );
  }
}


