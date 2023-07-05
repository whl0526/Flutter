import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Stream<int> streamFun() async* {
  for(int i =1; i<=5; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FutureProvider, StreamProvider test'),),
        body: MultiProvider(
          providers: [
            FutureProvider<String>(
              create: (context) =>
                  Future.delayed(Duration(seconds: 4), () => "world"),
              initialData: "hello",
            ),
            StreamProvider<int>(
              create: (context) => streamFun(),
              initialData: 0,
            ),
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
    var futureState = Provider.of<String>(context);
    var streamState = Provider.of<int>(context);

    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('future : ${futureState}',
            ),
            Text('stream : ${streamState}',
            ),
          
          ],
        ),
      ),
    );
  }
}