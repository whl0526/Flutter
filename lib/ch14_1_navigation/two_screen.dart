import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Two_Screen'),),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Two____Screen',style: TextStyle(color: Colors.white,fontSize: 30),),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/three");
                    },
                    child: Text('Go Three')
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Pop'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}