import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 50,height: 100,color: Colors.red,),
                    Container(width: 50,height: 50,color: Colors.green,),
                    Container(width: 50,height: 150,color: Colors.blue,),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(width: 50,height: 100,color: Colors.red,),
                    Container(width: 50,height: 50,color: Colors.green,),
                    Container(width: 50,height: 150,color: Colors.blue,),
                  ],
                ),
              ),

              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 5),
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(width: 50,height: 100,color: Colors.red,),
                    Container(width: 50,height: 50,color: Colors.green,),
                    Container(width: 50,height: 150,color: Colors.blue,),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 5),
                height: 200,
                child: Stack(
                  children: [
                    Container(color: Colors.red,),
                    Container(width: 100 ,height: 100,color: Colors.green,),
                    Container(width: 50,height: 50,color: Colors.blue,),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}