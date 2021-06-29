import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';
import 'package:anonymous_chat_flutter/model/usuario.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/app_bar.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/card_post.dart';
import 'package:anonymous_chat_flutter/service/postagem_service.dart';
import 'package:flutter/material.dart';

class TimelineApp extends StatefulWidget {
  Usuario usuario;

  TimelineApp({Key key, this.usuario}) : super(key: key);

  @override
  _TimelineAppState createState() => _TimelineAppState();
}

class _TimelineAppState extends State<TimelineApp> {
  List<Postagem> _listaPostagem = [];
  bool _buscar = true;

  void buscarPostagens() async {
    var lista = await PostagemService.listar();
    setState(() {
      _listaPostagem = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    buscarPostagens();

    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBarTimeLine(
        nameUser: widget.usuario.nome,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          '/cadastro_postagem',
          arguments: {'idUsuario': widget.usuario.id},
        ),
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          for (var postagem in _listaPostagem)
            CardPost(
              titulo: '${postagem.dataHora}',
              subTitulo: postagem.descricao,
              onPress: () => {
                Navigator.pushNamed(
                  context,
                  '/postagem',
                  arguments: {
                    'postagem': postagem,
                  },
                ),
              },
            )
        ],
      ),
    );
  }
}
