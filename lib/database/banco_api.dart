import 'dart:convert';
import 'package:anonymous_chat_flutter/model/postagem.dart';
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
        var body = json.decode(response.body);
        return body['status'];
      } else {
        print('Cadastrar erro: ${response.statusCode}');
        return false;
      }
    }).whenComplete(() => client.close());
  }

  static Future<bool> autenticaUsuario(String nome, String senha) async {
    var client = http.Client();

    await client.post(
      Uri.parse('$host/api/Login'),
      body: jsonEncode({
        'name': nome,
        'password': senha,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        var dados = json.decode(response.body);
        return dados['status'];
      } else {
        print('Erro login: ${response.statusCode}');
        return false;
      }
    }).whenComplete(() => client.close());
  }

  static Future<bool> criarPostagem(
      String titulo, String descricao, String idUsuario) async {
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
      } else {
        print('Erro retornarPostagem: ${response.statusCode}');
      }
    }).whenComplete(() {
      client.close();
    });

    return listaPostagem;
  }
}
