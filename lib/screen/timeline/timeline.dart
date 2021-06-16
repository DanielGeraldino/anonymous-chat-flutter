import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:anonymous_chat_flutter/core/rota.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/app_bar.dart';
import 'package:anonymous_chat_flutter/screen/timeline/componente/card_post.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          CardPost(
              titulo: 'Neque porro quisquam est',
              subTitulo:
                  'dasdLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a ex eget metus rutrum... ',
              data: '27/08/2021',
              onPress: () => Navigator.pushNamed(context, Rota.detalhePublica))
        ],
      ),
    );
  }
}
