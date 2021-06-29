class Usuario {
  String id;
  String nome;
  String email;
  String token;

  Usuario({
    this.id,
    this.nome,
    this.email,
    this.token,
  });

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
      id: '${parsedJson['idUser']}',
      nome: parsedJson['nome'],
      email: parsedJson['email'],
      token: parsedJson['token'],
    );
  }
}
