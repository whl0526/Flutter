import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  List<String> citys = [
    '서울시','인천시','부산시','대구시','대전시','광주시','울산시','세종시'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: GridView.builder(
          scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  children: [
                    Text(citys[index]),
                    Image.asset('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                  ],
                ),
              );
            },
            itemCount: citys.length,
        ),
      ),
    );
  }
}