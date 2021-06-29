import 'package:flutter/foundation.dart';
import 'package:flutter_svg/parser.dart';

class Postagem {
  int id;
  String titulo;
  String descricao;
  int idUsuario;
  DateTime dataHora;
  bool ativa;

  Postagem({
    this.id,
    this.titulo,
    this.descricao,
    this.idUsuario,
    this.dataHora,
    this.ativa,
  });

  factory Postagem.fromJson(Map<String, dynamic> parsedJson) {
    return Postagem(
      id: parsedJson['idPostagem'],
      titulo: parsedJson['titulo'],
      descricao: parsedJson['descricao'],
      idUsuario: parsedJson['idUsuario'],
      ativa: parsedJson['ativa'],
      dataHora: DateTime.parse(parsedJson['dataHoraPostagem']),
    );
  }
}
