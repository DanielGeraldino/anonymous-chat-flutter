import 'package:anonymous_chat_flutter/screen/login/login.dart';
import 'package:anonymous_chat_flutter/screen/post_detalhe/post_detalhe.dart';
import 'package:anonymous_chat_flutter/screen/splash/splashApp.dart';
import 'package:anonymous_chat_flutter/screen/timeline/timeline.dart';
import 'package:flutter/material.dart';

class Rota {
  static String splash = '/splash';
  static String login = '/login';
  static String timeline = '/timeline';
  static String detalhePublica = '/detalhe_publica';
  static String publicar = '/publicar';
  static String cadastro = '/cadastro';

  static Map<String, WidgetBuilder> rotas = {
    splash: (ctx) => SplashApp(),
    login: (ctx) => LoginApp(),
    timeline: (ctx) => TimelineApp(),
    detalhePublica: (ctx) => PostDetalheApp(),
    publicar: null,
    cadastro: null,
  };
}
