import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/texto_padrao.dart';
import 'package:anonymous_chat_flutter/screen/login/componente/button_login.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class TimelineApp extends StatefulWidget {
  const TimelineApp({Key key}) : super(key: key);

  @override
  _TimelineAppState createState() => _TimelineAppState();
}

class _TimelineAppState extends State<TimelineApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBarTimeLine(
        nameUser: 'DANIEL GERALDINO GUERRA',
      ),
      body: ListView(
        children: [
          Card(
            color: Cores.backgroundCard,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Neque porro quisquam est',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: TextPadrao.tituloCard,
                      fontWeight: FontWeight.bold,
                      color: Cores.textCard,
                    ),
                  ),
                  subtitle: Text(
                    'dasdLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a ex eget metus rutrum... ',
                    style: TextStyle(
                      fontSize: TextPadrao.textoCard,
                      color: Cores.textCard,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('VER MAIS'))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
