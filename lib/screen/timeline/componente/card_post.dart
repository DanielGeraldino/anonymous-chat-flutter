import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/texto_padrao.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';
import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  String titulo;
  String subTitulo;
  String data;
  Color cor;
  void Function() onPress;

  CardPost({
    Key key,
    @required this.titulo,
    @required this.subTitulo,
    @required this.onPress,
    @required this.data,
    this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onPress();
      },
      child: Card(
        color: cor != null ? cor : Cores.backgroundCard,
        child: Column(
          children: [
            ListTile(
              title: Text(
                this.titulo,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Cores.textCard,
                ),
              ),
              subtitle: Text(
                this.subTitulo,
                style: TextStyle(
                  fontSize: TextPadrao.textoCard,
                  color: Cores.textCard,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
