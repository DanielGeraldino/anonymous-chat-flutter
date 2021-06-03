import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonLogin extends StatelessWidget {
  void Function() onPress;
  String title;

  ButtonLogin({
    Key key,
    this.onPress,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      height: 40,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Cores.backgroundButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            color: Cores.textButton,
          ),
        ),
      ),
    );
  }
}