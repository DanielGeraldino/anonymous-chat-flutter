import 'package:anonymous_chat_flutter/screen/login/componente/button_login.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/campo_input_login.dart';
import 'package:anonymous_chat_flutter/screen/componentes/logo.dart';
import 'package:anonymous_chat_flutter/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
              onPress: () async {
                var _nome = controleUsuario.text;
                var _senha = controleSenha.text;
                EasyLoading.show(status: 'Autenticando');
                if (_nome.isNotEmpty) {
                  if (_senha.isNotEmpty) {
                    await UsuarioService.login(_nome, _senha).then(
                      (usuario) {
                        if (usuario != null) {
                          Navigator.pushNamed(
                            context,
                            '/timeline',
                            arguments: {
                              'usuario': usuario,
                            },
                          );
                          EasyLoading.showSuccess('Sucesso');
                        } else {
                          EasyLoading.showError('Nome/Senha invalido');
                        }
                      },
                    );
                  } else {
                    EasyLoading.showError('Nome/Senha invalido');
                  }
                } else {
                  EasyLoading.showError('Nome/Senha invalido');
                }
              },
            ),
            ButtonLogin(
              title: 'CADASTRAR',
              onPress: () => Navigator.pushNamed(context, '/cadastro'),
            )
          ],
        ),
      ),
    );
  }
}
