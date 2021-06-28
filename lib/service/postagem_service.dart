import 'package:anonymous_chat_flutter/database/banco_api.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';

class PostagemService {
  static Future<bool> cadastrar(
      String titulo, String descricao, String idUsuario) async {
    return await Api.criarPostagem(titulo, descricao, idUsuario);
  }


  static Future<List<Postagem>> listar() async {
    return await Api.retornaPostagens();
  }
}
