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

  GlobalKey<ChildWidgetState> childKey = GlobalKey();
  int childCount = 0;


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
  void getChildData(){
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childCount = childState?.childCount ?? 0;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('I am Parent, child count에서 얻은 값: $childCount'),
                  
                ),
                ElevatedButton(onPressed: getChildData, child: Text('get child data'))
              ],
            ),
            ChildWidget(key: childKey,),
            IconWidget(),
            ContentWidget(),
          ],
        ),
      ),
    );
  }
}
class ChildWidget extends StatefulWidget{
  ChildWidget({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();

  }
}
class ChildWidgetState extends State<ChildWidget>{
  int childCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am child, $childCount'),

        ),
        ElevatedButton(onPressed: (){
         setState(() {
           childCount++;
         });
        }, child: Text('increment'))
      ],
    );
  }
}
class IconWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state = context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
      child: IconButton(
        icon: ((state?.favorited ?? false) ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
        iconSize: 200,
        color: Colors.red,
        onPressed: state?.toggleFavorite,
      ),
    );
  }
}
class ContentWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state = context.findAncestorStateOfType<ParentWidgetState>();
    return Center(
      child: Text('favorite:${state?.favoriteCount}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    );
  }
}