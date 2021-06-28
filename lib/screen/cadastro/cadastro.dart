import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/database/banco_api.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/button_login.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/campo_input_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Cadastro extends StatelessWidget {
  final controlNome = TextEditingController();
  final focusNome = FocusNode();

  final controlSenha = TextEditingController();
  final focusSenha = FocusNode();

  final controlEmail = TextEditingController();
  final focusEmail = FocusNode();

  Cadastro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cores.background,
        appBar: AppBar(
          backgroundColor: Cores.backgroundAppBar,
          actions: [],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CampoInputLogin(
                hintText: 'Digite seu usuario',
                focusNode: focusNome,
                nextFocusNode: focusSenha,
                controller: controlNome,
              ),
              CampoInputLogin(
                hintText: 'Digite seu senha',
                focusNode: focusSenha,
                nextFocusNode: focusEmail,
                controller: controlSenha,
                obscureText: true,
              ),
              CampoInputLogin(
                hintText: 'Digite seu email',
                focusNode: focusEmail,
                nextFocusNode: null,
                controller: controlEmail,
              ),
              ButtonLogin(
                title: 'CADASTRAR',
                onPress: () async {
                  EasyLoading.show(status: 'Salvando');
                  final _nome = controlNome.text;
                  final _senha = controlSenha.text;
                  final _email = controlEmail.text;

                  if (_nome.isNotEmpty) {
                    if (_senha.isNotEmpty) {
                      if (_email.isNotEmpty) {
                        await Api.cadastrarUsuario(controlNome.text,
                                controlSenha.text, controlEmail.text)
                            .whenComplete(() => Navigator.popUntil(
                                context, ModalRoute.withName(Rota.login)));
                        EasyLoading.showSuccess('Usuario cadastrado');
                      } else {
                        EasyLoading.showError('Informe o email');
                      }
                    } else {
                      EasyLoading.showError('Informe a senha');
                    }
                  } else {
                    EasyLoading.showError('Informe o nome');
                  }
                },
              ),
            ],
          ),
        ));
  }
}
