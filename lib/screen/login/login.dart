import 'package:anonymous_chat_flutter/screen/login/componente/button_login.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/campo_input_login.dart';
import 'package:anonymous_chat_flutter/screen/componentes/logo.dart';
import 'package:anonymous_chat_flutter/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../core/cores_padroes.dart';

class LoginApp extends StatelessWidget {
  final controleUsuario = TextEditingController();
  final controleSenha = TextEditingController();
  final focusSenha = FocusNode();
  final focusUsuairo = FocusNode();

  LoginApp({Key key}) : super(key: key);

  void autenticarUsuario(String nome, String senha, ctx) async {
    EasyLoading.show(status: 'Autenticando');
    if (nome.isNotEmpty) {
      if (senha.isNotEmpty) {
        await UsuarioService.login(nome, senha).then(
          (usuario) {
            if (usuario != null) {
              Navigator.pushNamed(
                ctx,
                '/timeline',
                arguments: {
                  'usuario': usuario,
                },
              );
              EasyLoading.showSuccess('Sucesso');
            } else {
              EasyLoading.showError('Nome/Senha');
            }
          },
        );
      } else {
        EasyLoading.showError('Nome/Senha invalido');
      }
    } else {
      EasyLoading.showError('Nome/Senha invalido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
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
              onPress: () async {
                var _nome = controleUsuario.text;
                var _senha = controleSenha.text;
                autenticarUsuario(_nome, _senha, context);
              },
            ),
            ButtonLogin(
              title: 'CADASTRAR',
              onPress: () => Navigator.pushNamed(context, '/cadastro'),
            ),
            ButtonLogin(
              title: 'SOBRE',
              onPress: () {
                Alert(
                        context: context,
                        title: "SOBRE",
                        desc:
                            "UC-Secrect é app cujo o usuario pode ler e postar textos em anonimato.\n\nFeito por:\nDaniel Guerra\nRusley Santos\n\n2021/1")
                    .show();
              },
            )
          ],
        ),
      ),
    );
  }
}
