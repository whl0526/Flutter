import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  }
  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/text/my_text.txt');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('text'),
        ),
        body: Column(
          children: [
            Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
            FutureBuilder(
              future: useRootBundle(),
                builder: (context, snapshot){
                return Text('rootBundle : ${snapshot.data}');
                }
            ),
            FutureBuilder(
                future: useDefaultAssetBundle(context),
                builder: (context, snapshot){
                  return Text('DefaultAssetBundle : ${snapshot.data}');
                }
            ),
          ],
        ),
      ),
    );
  }
}
