import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}
class _MainAppState extends State<MainApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate:  MyRouteDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}
class MyRoutePath {
  String? id;
  MyRoutePath.home() : this.id = null;
  MyRoutePath.detail(this.id);
}
class MyRouteInformationParser extends RouteInformationParser<MyRoutePath>{
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if(uri.pathSegments.length >= 2){
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    }else{
      return MyRoutePath.home();
    }
  }
  @override
  RouteInformation? restoreRouteInformation(MyRoutePath configuration) {
    if(configuration.id != null){
      return RouteInformation(location: '/detail/${configuration.id}');

    }else {
      return RouteInformation(location: '/');
    }
  }
}

class MyRouteDelegate extends RouterDelegate<MyRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath>{
  String? selectId;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  MyRoutePath? get currentConfiguration {
   if(selectId != null){
     return MyRoutePath.detail(selectId);
   }else{
     return MyRoutePath.home();
   }
  }
  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if(configuration.id != null){
      selectId = configuration.id;
    }
  }
  void _handleOnPressed(String id){
    selectId = id;
    notifyListeners();
  }
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_handleOnPressed)),
        if(selectId != null) MaterialPage(child: DetailScreen(selectId))
      ],
      onPopPage: (route, result) {
        if(!route.didPop(result)){
          return false;
        }
        selectId = null;
        notifyListeners();
        return true;
      },
    );
  }

}

class HomeScreen extends StatelessWidget{
  final ValueChanged<String> onPressed;
  HomeScreen(this.onPressed); //생성자 매개변수로 전달
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HomeScreen',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () => onPressed('1'),
                  child: Text('go detail with 1')
              ),
              ElevatedButton(
                  onPressed: () => onPressed('2'),
                  child: Text('go detail with 2')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DetailScreen extends StatelessWidget{
  String? id;
  DetailScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            'Detail Screen $id',
            style: TextStyle(color: Colors.white,fontSize: 30),
          ),
        ),
      ),
    );
  }
}