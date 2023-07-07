import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/ch2/test.dart';
import 'package:flutter_lab/ch8_4_stateful/test.dart';

abstract class CounterEvent{
  int no;
  CounterEvent(this.no); //클래스의 생성자를 정의합니다. 생성자는 no 변수를 초기화하는 역할을 합니다.
}
class IncrementEvent extends CounterEvent {
  IncrementEvent(int no): super(no); //클래스의 생성자를 정의합니다. 생성자는 no 값을 상위 클래스인 CounterEvent의 생성자에 전달하여 초기화합니다.
}
class DecrementEvent extends CounterEvent{
  DecrementEvent(int no): super(no);
}

class BlocCounter extends Bloc<CounterEvent, int>{
  BlocCounter():super(0){
    on<IncrementEvent>((event,emit){
      emit(state + event.no);
    });
    on<DecrementEvent>((event,emit){
      emit(state - event.no);
    });
  }
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
  }
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print('transition...$transition');
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bloc test'),),
        body: BlocProvider<BlocCounter>(
          create: (context) => BlocCounter(),
          child: MyWidget(),
        ),
      ),
    );
  }
}
class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    return BlocBuilder<BlocCounter, int>(
        builder: (context, count){
          return Container(
            color: Colors.deepOrange,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${counterBloc.state}'
                  ),
                  ElevatedButton(
                      onPressed: (){
                        counterBloc.add(IncrementEvent(2));
                      },
                      child: Text('increment')
                  ),
                  ElevatedButton(
                      onPressed: (){
                        counterBloc.add(DecrementEvent(2));
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