import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/imagens_caminhos.dart';
import 'package:anonymous_chat_flutter/core/texto_padrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Imagenscaminhos.logo,
            height: 200,
          ),
          SizedBox(
            height: 2,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Cores.textLogo,
                fontSize: TextPadrao.logo,
              ),
              text: 'UC - ',
              children: [
                TextSpan(
                  style: TextStyle(
                    color: Cores.textLogo,
                    fontSize: TextPadrao.logo,
                    fontWeight: FontWeight.bold,
                  ),
                  text: 'Secret',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
