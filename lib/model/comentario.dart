class Comentario {
  String id;
  String idPostagem;
  String textoComentario;
  DateTime dataCriacao;

  Comentario({
    this.id,
    this.idPostagem,
    this.textoComentario,
    this.dataCriacao,
  });

  factory Comentario.fromJson(Map<String, dynamic> parsedJson) {
    return Comentario(
      id: '${parsedJson['idComentario']}',
      idPostagem: '${parsedJson['idPostagem']}',
      textoComentario: parsedJson['descricao'],
      dataCriacao: DateTime.parse(parsedJson['dataHoraComentario']),
    );
  }
}
