import 'package:flutter/material.dart';
import 'Home.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'News App',
//       theme: ThemeData(
//         primarySwatch: Colors.red
//       ),
//       home: Home()
//     );
//   }
// }



import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Home(),
      title: new Text('Welcome to todays news',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white
      ),),
     
      backgroundColor: Colors.blue,
      styleTextUnderTheLoader: new TextStyle(),
      
      loaderColor: Colors.white
    );
  }
}


