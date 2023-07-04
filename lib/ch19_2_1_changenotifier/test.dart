//49.변경된 상태를 하위 위젯어 적용하기
import 'package:flutter_lab/ch_19_1_provider/test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ChangeNotifierProvider test'),),
        body: ChangeNotifierProvider<Counter>.value(
          value:Counter() ,
          child: SubWidget(),
        ),
      ),
    );
  }
}
class SubWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Provider count : ${counter.count}',
            ),
            ElevatedButton(
                onPressed: (){
                  counter.increment();
                },
                child: Text('increment')
            ),
          ],
        ),
      ),
    );
  }
}