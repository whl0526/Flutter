import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8_4_stateful/test.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
  void increment(){
    count++;
    update();
  }
  void decrement(){
    count--;
    update();
  }
}

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX test'),
        ),
        body: GetBuilder(
          init: CounterController(),
          builder: (_){
            return MyWidget();
          },
        ),
      ),
    );
  }
}
class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
        builder: (controller){
          return Container(
            color: Colors.orange,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GetX: ${controller.count}',
                  ),
                  ElevatedButton(
                      onPressed: (){
                        controller.increment();
                      },
                      child: Text('increment')
                  ),
                  ElevatedButton(
                      onPressed: (){
                        controller.decrement();
                      },
                      child: Text('decrement')
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}