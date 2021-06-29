import 'dart:convert';
import 'package:anonymous_chat_flutter/model/comentario.dart';
import 'package:anonymous_chat_flutter/model/postagem.dart';
import 'package:anonymous_chat_flutter/model/usuario.dart';
import 'package:http/http.dart' as http;

class Api {
  static final String host = 'http://localhost:57184/api';

  static Future<bool> cadastrarUsuario(
      String nome, String senha, String email) async {
    var client = http.Client();

    await client.post(
      Uri.parse('$host/CriarUsuario'),
      body: jsonEncode({
        "nome": nome,
        "senha": senha,
        "email": email,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        return dados['status'] as bool;
      } else {
        print('Cadastrar erro: ${response.statusCode}');
        return false;
      }
    }).whenComplete(() => client.close());
  }

  static Future<Usuario> autenticaUsuario(String nome, String senha) async {
    var client = http.Client();
    var usuario;

    await client.post(
      Uri.parse('$host/Login'),
      body: jsonEncode({
        'username': nome,
        'password': senha,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        if (dados['status'] as bool) {
          usuario = Usuario.fromJson(dados['objectsReturn']);
        }
        usuario = null;
      } else {
        print('Erro login: ${response.statusCode}');
        usuario = null;
      }
    }).whenComplete(() => client.close());

    return usuario;
  }

  static Future<bool> criarPostagem(String descricao, String idUsuario) async {
    var client = http.Client();
    var foiPostado = false;

    await client.post(
      Uri.parse('$host/CriarPostagem'),
      body: jsonEncode({
        "descricao": descricao,
        "ativa": true,
        "idUsuario": idUsuario,
        "cor": "verde",
        "customizada": true,
        "idCustomizacaoPostagem": 0,
        "idFotoFundoPostagem": 0
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        foiPostado = true;
      } else {
        print('Erro criarPostagem: ${response.statusCode}');
        foiPostado = false;
      }
    }).whenComplete(() => client.close());

    return foiPostado;
  }

  static Future<List<Postagem>> retornaPostagens() async {
    var client = http.Client();
    List<Postagem> listaPostagem = [];

    await client
        .post(
            Uri.parse('$host/RetornarPostagemPaginada?pagina=1&quantidade=10'))
        .then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        var listaPostagemJson = dados['objectsReturn'] as List;

        listaPostagemJson.forEach((postagem) {
          listaPostagem.add(Postagem.fromJson(postagem));
        });

        listaPostagem.sort(
          (a, b) => b.dataHora.compareTo(a.dataHora),
        );
      } else {
        print('Erro retornarPostagem: ${response.statusCode}');
      }
    }).whenComplete(() {
      client.close();
    });

    return listaPostagem;
  }

  static Future<List<Comentario>> retornaComenario(String idPostagem) async {
    var client = http.Client();
    List<Comentario> lista = [];

    await client
        .post(Uri.parse(
            '$host/RetornarComentario?idPostagem=$idPostagem&pagina=1&quantidade=100'))
        .then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        var listaComentarioJson = dados['objectsReturn'] as List;

        listaComentarioJson.forEach((comentario) {
          lista.add(Comentario.fromJson(comentario));
        });

        lista.sort(
          (a, b) => b.dataCriacao.compareTo(a.dataCriacao),
        );
      } else {
        print('Erro retornaComentario: ${response.statusCode}');
      }
    }).whenComplete(() {
      client.close();
    });

    return lista;
  }

  static Future<bool> criarComentario(
      String descricao, String idPostagem) async {
    var client = http.Client();
    var foiPostado = false;

    await client.post(
      Uri.parse('$host/PostarComentario'),
      body: jsonEncode({
        "idPostagem": idPostagem,
        "comentario": descricao,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        foiPostado = dados['status'];
      } else {
        print('Erro criarPostagem: ${response.statusCode}');
        foiPostado = false;
      }
    }).whenComplete(() => client.close());

    return foiPostado;
  }
}
