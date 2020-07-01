import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: FlareActor("assets/AnimGears.flr", animation: "spin1",),
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home())
      );
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Flutter + Flare",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 200,
            width: 200,
            child: FlareActor("assets/HeartAnim.flr", animation: "pulse",),
          ),
        ],
      ),
    );
  }
}
