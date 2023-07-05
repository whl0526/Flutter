//48.멀티 프로바이더 활용하기
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
        appBar: AppBar(title: Text('MultiProvider test'),),
        body: MultiProvider(
          providers: [
            Provider<int>.value(value: 10),
            Provider<String>.value(value: 'hello'),
            ChangeNotifierProvider<Counter>.value(value:Counter(),),
          ],
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
    var int_data = Provider.of<int>(context);
    var string_data = Provider.of<String>(context);
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Provider : ',
            ),
            Text(
              'Int data : $int_data',
            ),
            Text(
              'String data : $string_data',
            ),
            Text(
              'Counter data : ${counter.count}',
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