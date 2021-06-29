import 'package:anonymous_chat_flutter/database/banco_api.dart';
import 'package:anonymous_chat_flutter/model/comentario.dart';

class ComentarioService {
  static Future<bool> criar(String descricao, String idPostagem) async {
    return await Api.criarComentario(descricao, idPostagem);
  }

  static Future<List<Comentario>> listar(String idPostagem) async {
    return await Api.retornaComenario(idPostagem);
  }
}
