import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/app_bar.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/card_post.dart';
import 'package:anonymous_chat_flutter/service/postagem_service.dart';
import 'package:flutter/material.dart';

class TimelineApp extends StatefulWidget {
  const TimelineApp({Key key}) : super(key: key);

  @override
  _TimelineAppState createState() => _TimelineAppState();
}

class _TimelineAppState extends State<TimelineApp> {
  List<Postagem> _listaPostagem = [];
  bool _buscar = true;

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      buscarPostagens();
      await Future.delayed(Duration(minutes: 1));
      return _buscar;
    });
  }

  void buscarPostagens() async {
    var lista = await PostagemService.listar();
    setState(() {
      _listaPostagem = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBarTimeLine(
        nameUser: 'DANIEL GERALDINO GUERRA',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Rota.cadastroPostagem),
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          for (var postagem in _listaPostagem)
            CardPost(
              titulo: 'titulo',
              subTitulo: postagem.descricao,
              data: '',
              onPress: () =>
                  {Navigator.pushNamed(context, Rota.detalhePublica)},
            )
        ],
      ),
    );
  }
}
