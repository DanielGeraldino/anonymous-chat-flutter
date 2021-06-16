import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/button_login.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/campo_input_login.dart';
import 'package:anonymous_chat_flutter/screen/componentes/logo.dart';
import 'package:flutter/material.dart';
import '../../core/cores_padroes.dart';

class LoginApp extends StatelessWidget {
  final controleUsuario = TextEditingController();
  final controleSenha = TextEditingController();
  final focusSenha = FocusNode();
  final focusUsuairo = FocusNode();

  LoginApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            CampoInputLogin(
              hintText: 'Digite seu usuario',
              focusNode: focusUsuairo,
              nextFocusNode: focusSenha,
              controller: controleUsuario,
            ),
            CampoInputLogin(
              hintText: 'Digite sua senha',
              controller: controleSenha,
              focusNode: focusSenha,
              nextFocusNode: null,
              obscureText: true,
            ),
            ButtonLogin(
              title: 'ENTRAR',
              onPress: () => Navigator.pushNamed(context, Rota.timeline),
            )
          ],
        ),
      ),
    );
  }
}
