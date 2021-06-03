import 'package:anonymous_chat_flutter/screen/componentes/logo.dart';
import 'package:flutter/material.dart';
import '../../core/cores_padroes.dart';

class SplashApp extends StatelessWidget {
  const SplashApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: Center(child: Logo()),
    );
  }
}
