import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/service/postagem_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CadastrarPostagem extends StatefulWidget {
  const CadastrarPostagem({Key key}) : super(key: key);

  @override
  _CadastrarPostagemState createState() => _CadastrarPostagemState();
}

class _CadastrarPostagemState extends State<CadastrarPostagem> {
  @override
  Widget build(BuildContext context) {
    final tituloController = TextEditingController();
    final decricaoController = TextEditingController();

    var _selectedIndex = 2;

    void _onItemTapped(int index) async {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 2) {
        String titulo = tituloController.text;
        String descricao = decricaoController.text;
        EasyLoading.show(status: 'Salvando');
        await PostagemService.cadastrar(titulo, descricao, '1').then((value) {
          if (value) {
            EasyLoading.showSuccess('Postagem salva com sucesso');
            Navigator.pop(context);
          } else {
            EasyLoading.showError('Falha ao salvar postagem');
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        backgroundColor: Cores.backgroundAppBar,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Cancelar',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Imagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Cadastrar',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Cores.backgroudtextInput,
              child: TextFormField(
                controller: tituloController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: 'Informe o titulo',
                  labelText: 'Informe o titulo',
                  border: InputBorder.none,
                ),
              ),
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
