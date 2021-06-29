import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/screen/componentes/logo.dart';
import 'package:flutter/material.dart';
import '../../core/cores_padroes.dart';

class SplashApp extends StatefulWidget {
  SplashApp({Key key}) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).whenComplete(
      () => Navigator.pushNamed(context, '/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: Center(child: Logo()),
    );
  }
}
