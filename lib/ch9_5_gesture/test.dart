import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  onPressed(){
    print('icon button click');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
              onTap: (){
                print('image click');
              },
              onVerticalDragStart: (DragStartDetails details  ){
                print('vertical drag start... global position: ${details.globalPosition.dx},${details.globalPosition.dy}');
                print('vertical drag start... local position : ${details.localPosition.dx}, ${details.localPosition.dy} ');
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print('Elevatedbutton click');
                },
                child: Text('Click me'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}