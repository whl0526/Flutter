import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(title: Text('Four_Screen'),),
       body: Container(
         color: Colors.red,
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Four____Screen',style: TextStyle(color: Colors.white,fontSize: 30),),
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