import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/test.dart';

void main(){
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget{
  List<User> users = [
    User('홍길동','0100','a@a.com'),
    User('이길동','0101','b@b.com'),
    User('박길동','0102','c@c.com'),
    User('김길동','0103','d@d.com'),
    User('홍길동1','0104','a@a.com'),
    User('이길동2','0105','b@b.com'),
    User('박길동3','0106','c@c.com'),
    User('김길동4','0107','d@d.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: ListView.separated(
            itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('images/icon/josh-berquist-pjxe3p4u5aI-unsplash.jpg'),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].phone),
                trailing: Icon(Icons.more_vert),
                onTap: (){
                  print(users[index].name);
                },
              );
            },
            separatorBuilder:(context,index){
              return Divider(height: 2,color:Colors.black);
            },
            itemCount: users.length
        ),
      ),
    );
  }
}