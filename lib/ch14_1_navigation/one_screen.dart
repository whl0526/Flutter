import 'package:flutter/material.dart';

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
                    onPressed: (){
                      Navigator.pushNamed(context, "/two");
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