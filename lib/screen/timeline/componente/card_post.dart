import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/texto_padrao.dart';
import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  String titulo;
  String subTitulo;
  void Function() onPress;

  CardPost({
    Key key,
    @required this.titulo,
    @required this.subTitulo,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Cores.backgroundCard,
      child: Column(
        children: [
          ListTile(
            title: Text(
              this.titulo,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: TextPadrao.tituloCard,
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
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: this.onPress, child: Text('VER MAIS'))
            ],
          )
        ],
      ),
    );
  }
}
