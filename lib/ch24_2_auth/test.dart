import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lab/ch2/test.dart';
import '../firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.purple,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.lightBlue,
     ),
     home: AuthWidget(),
   );
  }
}

class AuthWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AuthWidgetState();
  }
}
class AuthWidgetState extends State<AuthWidget>{
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool isInput = true;
  bool isSignIn = true;
  
  signIn() async {
    try{
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value){
            print(value);
            if(value.user!.emailVerified){
              setState(() {
                isInput = false;
              });
            }else{
              showToast('emailVerified error');
            }
            return value;
      });
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        showToast('user-not-found');
      }else if(e.code == 'wrong-password'){
        showToast('wrong-password');
      }else{
        print(e.code);
      }
    }
  }
  signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isInput = true;
    });
  }
  signUp() async{
    try{
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value){
            if(value.user!.email != null){
              FirebaseAuth.instance.currentUser?.sendEmailVerification();
              setState(() {
                isInput = false;
              });
            }
            return value;
      });
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        showToast('weak-password');
      }else if(e.code == 'email-already-in-use'){
        showToast('email-already-in-use');

      }else{
        showToast('other error');
        print(e.code);
      }
    }catch(e){
      print(e.toString());
    }
  }

  List<Widget> getInputWidget(){
    return [
      Text(
        isSignIn ? "Signin": "SignUp",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,

        ),
        textAlign: TextAlign.center,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'email'),
              validator: (value){
                if(value?.isEmpty ?? false){
                  return 'please enter email';
                }
                return null;
              },
              onSaved: (String? value){
                email = value ?? "";
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,//****password
              validator: (value){
                if(value?.isEmpty ?? false){
                  return 'please enter password';
                }
                return null;
              },
              onSaved: (String? value){
                password = value ?? "";
              },
            ),
            ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState?.validate() ?? false){
                    _formKey.currentState?.save();
                    if(isSignIn){
                      signIn();
                    }else{
                      signUp();
                    }
                  }
                },
                child: Text(isSignIn ? "SignIn": "SignUp")
            ),
            RichText(
              textAlign: TextAlign.right,
                text: TextSpan(
                  text: 'Go',
                  style: Theme.of(context).textTheme.bodyText1,
                  children:[
                    TextSpan(
                      text: isSignIn ? "SignUp" : "SignIn",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        setState(() {
                          isSignIn = !isSignIn; //현재 상태를 반대로
                        });
                        }
                    )
                  ]

                )
            ),
          ],
        ),
      )

    ];
  }
  List<Widget> getResultWidget(){
    String resultEmail = FirebaseAuth.instance.currentUser!.email!;
    return [
      Text(
        isSignIn
        ? "$resultEmail 로 로그인 하셨습니다."
            : "$resultEmail 로 회원가입하셨습니다. 이메일 인증을 거쳐야 로그인이 가능합니다.",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),


      ),
      ElevatedButton(
          onPressed: (){
            if(isSignIn){
              signOut();
            }else{
              setState(() {
                isInput = true;
                isSignIn = true;
              });
            }
          },
          child: Text(isSignIn ? "SignOut" : "SignIn"),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auth Test"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: isInput ? getInputWidget() : getResultWidget(),
      ),
    );
  }
}