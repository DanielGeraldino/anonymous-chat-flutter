import 'package:anonymous_chat_flutter/database/banco_api.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';

class PostagemService {
  static Future<bool> cadastrar(String descricao, String idUsuario) async {
    print('id usuario' + idUsuario);
    return await Api.criarPostagem(descricao, idUsuario);
  }

  static Future<List<Postagem>> listar() async {
    return await Api.retornaPostagens();
  }
}
