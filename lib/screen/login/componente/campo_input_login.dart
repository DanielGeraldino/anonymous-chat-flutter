import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CampoInputLogin extends StatelessWidget {
  String hintText;
  bool obscureText;
  FocusNode focusNode;
  FocusNode nextFocusNode;

  TextEditingController controller;

  CampoInputLogin({
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 294,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Cores.backgroudtextInput,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        onFieldSubmitted: (texto) {
          Focus.of(context).requestFocus(nextFocusNode);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
