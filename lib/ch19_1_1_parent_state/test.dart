import 'package:flutter/material.dart';

void main(){
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return ParentWidgetState();
  }
}
class ParentWidgetState extends State<ParentWidget>{
  bool favorited = false;
  int favoriteCount = 10;
  
  void toggleFavorite(){
    setState(() {
      if(favorited){
        favoriteCount -= 1;
        favorited = false;
        
      }else{
        favoriteCount += 1;
        favorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(favorited: favorited,onChanged: toggleFavorite),
            ContentWidget(favoriteCount: favoriteCount),
          ],
        ),
      ),
    );
  }
}
class IconWidget extends StatelessWidget{
  final bool favorited;
  final Function onChanged;

  IconWidget({this.favorited = false, required this.onChanged});

  void _handleTap(){
    onChanged();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: (favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 200,
        color: Colors.red,
        onPressed: _handleTap,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final int favoriteCount;
  ContentWidget({required this.favoriteCount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('favorite:$favoriteCount',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          
        ),
      ],
    );
  }
}