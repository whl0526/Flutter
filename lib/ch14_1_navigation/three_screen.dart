import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Three_Screen'),),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Three____Screen',style: TextStyle(color: Colors.white,fontSize: 30),),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/four");
                    },
                    child: Text('Go Four')
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