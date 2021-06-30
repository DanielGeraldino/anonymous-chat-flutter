import 'package:anonymous_chat_flutter/screen/cadastrar_post/cadastrar_postagem.dart';
import 'package:anonymous_chat_flutter/screen/cadastro/cadastrar.dart';
import 'package:anonymous_chat_flutter/screen/login/login.dart';
import 'package:anonymous_chat_flutter/screen/post_detalhe/post_detalhe.dart';
import 'package:anonymous_chat_flutter/screen/splash/splashApp.dart';
import 'package:anonymous_chat_flutter/screen/timeline/timeline.dart';
import 'package:flutter/material.dart';

class Rota {
  RouteFactory routes() {
    const splash = '/splash';
    const login = '/login';
    const timeline = '/timeline';
    const detalhePublica = '/postagem';
    const cadastro = '/cadastro';
    const cadastroPostagem = '/cadastro_postagem';

    return (config) {
      final Map<String, dynamic> arguments = config.arguments;

      Widget screen;
      switch (config.name) {
        case login:
          screen = LoginApp();
          break;
        case timeline:
          screen = TimelineApp(
            usuario: arguments['usuario'],
          );
          break;
        case detalhePublica:
          screen = PostDetalheApp(
            postagem: arguments['postagem'],
          );
          break;
        case cadastro:
          screen = Cadastro();
          break;
        case cadastroPostagem:
          screen = CadastrarPostagem(
            idUsuario: arguments['idUsuario'],
          );
          break;
        default:
          screen = SplashApp();
      }

      return MaterialPageRoute(builder: (context) => screen);
    };
  }
}
