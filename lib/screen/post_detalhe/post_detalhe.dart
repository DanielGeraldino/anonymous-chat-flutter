import 'package:anonymous_chat_flutter/model/comentario.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';
import 'package:anonymous_chat_flutter/service/comentario_sevice.dart';
import 'package:flutter/material.dart';
import '../../core/cores_padroes.dart';

class PostDetalheApp extends StatefulWidget {
  Postagem postagem;
  PostDetalheApp({Key key, this.postagem}) : super(key: key);

  @override
  _PostDetalheState createState() => _PostDetalheState();
}

class _PostDetalheState extends State<PostDetalheApp> {
  final controller = TextEditingController();
  List<Comentario> comentarios = [];

  void buscarComentario() async {
    List<Comentario> lista =
        await ComentarioService.listar('${widget.postagem.id}');
    setState(() {
      comentarios = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    buscarComentario();

    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        backgroundColor: Cores.backgroundAppBar,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_outlined),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Cores.backgroundCard,
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              // title: Text('Neque porro quisquam est'),
              subtitle: Text(
                widget.postagem.descricao,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Cores.backgroundCard,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Text('Comentarios: '),
                for (var comentario in comentarios)
                  ComentarioWidget(descricao: comentario.textoComentario),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.send),
                          onTap: () async {
                            var descricao = controller.text;
                            if (descricao.isNotEmpty) {
                              await ComentarioService.criar(
                                      descricao, '${widget.postagem.id}')
                                  .whenComplete(() {
                                buscarComentario();
                                controller.text = "";
                              });
                            }
                          },
                        ),
                        hintText: 'Digite um comentario',
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComentarioWidget extends StatelessWidget {
  String descricao;

  ComentarioWidget({Key key, this.descricao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Cores.backgroundComeent),
      child: Row(
        children: [
          CircleAvatar(radius: 30),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              descricao,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
