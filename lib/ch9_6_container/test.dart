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
        body: Container(
          height: Size.infinite.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.yellow,
              ]
            )
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                  fit: BoxFit.cover
                )
              ),
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}