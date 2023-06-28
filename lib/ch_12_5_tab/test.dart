import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<MyApp> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);//애니메이션 효과

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: 'One'),
            Tab(text: 'Tne'),
            Tab(text: 'Three'),
          ],
        ),
        ),
        body:TabBarView(
          controller:controller,
          children: [
            Center(
              child: Text(
                  'One Screen',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Two Screen',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Three Screen',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }


}