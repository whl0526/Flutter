import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 300,
                child: Row(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 100,
                    ),
                    Expanded(
                      flex: 1,
                        child: Container(
                          color: Colors.amber,
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                height: 30,
                child: Row(
                  children: [
                    Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                    Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                    Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                    Spacer(),
                    Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}