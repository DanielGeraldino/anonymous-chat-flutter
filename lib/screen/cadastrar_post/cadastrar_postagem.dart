import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/service/postagem_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CadastrarPostagem extends StatefulWidget {
  String idUsuario;
  CadastrarPostagem({this.idUsuario});

  @override
  _CadastrarPostagemState createState() => _CadastrarPostagemState();
}

class _CadastrarPostagemState extends State<CadastrarPostagem> {
  @override
  Widget build(BuildContext context) {
    final tituloController = TextEditingController();
    final decricaoController = TextEditingController();

    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        backgroundColor: Cores.backgroundAppBar,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          EasyLoading.show(status: 'Salvando postagem');
          if (decricaoController.text.isNotEmpty) {
            await PostagemService.cadastrar(
              decricaoController.text,
              widget.idUsuario,
            ).then((value) {
              if (value) {
                EasyLoading.showSuccess('Salvo!');
                Navigator.pop(context);
              } else {
                EasyLoading.showError("Falha ao salvar");
              }
            });
          } else {
            EasyLoading.showError('Favor escrever a postagem');
          }
        },
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 5),
            //   color: Cores.backgroudtextInput,
            //   child: TextFormField(
            //     controller: tituloController,
            //     decoration: InputDecoration(
            //       contentPadding:
            //           EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //       hintText: 'Informe o titulo',
            //       labelText: 'Informe o titulo',
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Cores.backgroudtextInput,
              height: MediaQuery.of(context).size.height * .7,
              child: TextField(
                controller: decricaoController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 100,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: 'Digite a descrição',
                  labelText: 'Digite a descrição',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
