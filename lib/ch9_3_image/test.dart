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
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Column(
          children: [
            Image(image: NetworkImage('https://slp-statics.astockcdn.net/static_assets/staging/23spring/kr/home/curated-collections/card-5.jpg?width=580&format=webp'),),
            Container(
              color: Colors.red,
              child: Image.asset(
                'images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.fill
              ),
            ),
          ],
        ),
      ),
    );
  }
}