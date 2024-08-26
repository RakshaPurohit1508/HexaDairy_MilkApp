import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/firstscreen.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Beatz());
 }

class Beatz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hexa Dairy",
      home: SplashScreen(),
    );
    //throw UnimplementedError();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 6),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:Center(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/HEXA2.gif'),
                    fit: BoxFit.fill,
                  )
              )
          ) ,
        )
    );
  }

}
