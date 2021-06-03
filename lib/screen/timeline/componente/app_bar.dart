import 'package:anonymous_chat_flutter/core/cores_padroes.dart';
import 'package:flutter/material.dart';

class AppBarTimeLine extends PreferredSize {
  String nameUser;
  String linkImagePerfil;

  AppBarTimeLine({
    @required this.nameUser,
    this.linkImagePerfil,
  });

  @override
  Size get preferredSize => Size.fromHeight(98);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Cores.backgroundAppBar,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40,
            child: ClipOval(
              child: Image.asset(
                'image/perfil.jpg',
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            nameUser,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
