import 'package:anonymous_chat_flutter/database/banco_api.dart';
import 'package:anonymous_chat_flutter/model/usuario.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService {
  static Future<Usuario> login(String nome, String senha) async {
    Usuario usuario = await Api.autenticaUsuario(nome, senha);
    return usuario;
  }

  static Future<bool> cadastrar({
    @required String nome,
    @required String email,
    @required String senha,
  }) async {
    return await Api.cadastrarUsuario(nome, senha, email);
  }
}
