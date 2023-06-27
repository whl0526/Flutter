import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  PageController controller = PageController(initialPage: 1,viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: PageView(
          controller: controller,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.red,
              child: Center(
                child: Text('OnePage',style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.green,
              child: Center(
                child: Text('TwoPage',style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.blue,
              child: Center(
                child: Text('ThreePage',style: TextStyle(color: Colors.white, fontSize: 30),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}