import 'package:flutter/material.dart';
import 'user.dart';
class OneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('One_Screen'),),
        body: Container(
          color: Colors.purple,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('One____Screen',style: TextStyle(color: Colors.white,fontSize: 30),),
                ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                          context, "/two",
                      arguments: {
                            "arg1":10,
                        "arg2":"hello",
                        "arg3":User('kkang','seoul'),
                      }
                      );
                      print('result ${(result as User).name}');
                    },
                    child: Text('Go two')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}