import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';
import 'package:provider/provider.dart';
//rebuild 안되게끔 컨슈머 사용하기
class MyDataModel1 with ChangeNotifier {
  int data = 0;
  void changeData() {
    data++;
    notifyListeners();

  }
}
class MyDataModel2 with ChangeNotifier{
  String data = "hello";
      void changeData(){
    if(data == 'hello'){
      data = 'world';
    }else {
      data = 'hello';
    }
    notifyListeners();
  }
}
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumer test'),

        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyDataModel1>.value(value: MyDataModel1()),
            ChangeNotifierProvider<MyDataModel2>.value(value: MyDataModel2()),
          ],
          child: HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer2<MyDataModel1, MyDataModel2>(
              builder: (context, model1, model2, child){
                return SubWidget1(model1, model2, child);
              },
              child: SubWidget2(),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: (){
                      var model1 = Provider.of<MyDataModel1>(context, listen: false);//리 빌드 필요없다
                      model1.changeData();
                    },
                    child: Text('Model1 Data change')
                ),
                ElevatedButton(
                    onPressed: (){
                      var model2 = Provider.of<MyDataModel2>(context, listen: false);//리 빌드 필요없다
                      model2.changeData();
                    },
                    child: Text('Model2 Data change')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SubWidget1 extends StatelessWidget{
  MyDataModel1 model1;
  MyDataModel2 model2;
  Widget? child;
  SubWidget1(this.model1, this.model2, this.child);
  @override
  Widget build(BuildContext context) {
   return Container(
     color: Colors.green,
     padding: EdgeInsets.all(20),
     child: Column(
       children: [
         Text(
           'I am SubWidget1, ${model1.data}, ${model2.data}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),
         ),
         child!,
       ],
     ),
   );
  }
}
class SubWidget2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     color: Colors.deepPurpleAccent,
     padding: EdgeInsets.all(20),
     child: Text(
       'I am SubWidget2',
       style: TextStyle(
         fontSize: 20,
         fontWeight: FontWeight.bold,
         color: Colors.white,
       ),
     ),
   );
  }
}
