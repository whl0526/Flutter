import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CUBIT TEST'),),
        body: BlocProvider(
          create: (_) => CounterCubit(),
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CounterCubit>(context);
    return BlocBuilder<CounterCubit,int>(
        builder: (context, count){
          return Container(
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Cubit : $count'
                  ),
                  ElevatedButton(
                      onPressed: (){
                        cubit.increment();
                      },
                      child: Text(
                        '증가increment'
                      ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      cubit.decrement();
                    },
                    child: Text(
                        '감소decrement'
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );

  }
}
