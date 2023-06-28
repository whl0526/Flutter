import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget plateformUI(){
    if(Platform.isIOS){
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Cupertino Title'),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(child: Text('Click'), onPressed: (){}),
              Center(
                child: Text('HelloWorld'),
              ),
            ],
          ),
        ),
      );
    }else if(Platform.isAndroid){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Material Title')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child:Text('Click')),
              Text('HelloWorld')
            ],
          ),


        ),
      );

    }else{
      return Text('unknwon device',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return plateformUI();
  }
}