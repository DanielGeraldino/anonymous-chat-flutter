import 'package:anonymous_chat_flutter/screen/cadastrar_post/cadastrar_postagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/rota.dart';

main() => runApp(
      MaterialApp(
        builder: EasyLoading.init(),
        onGenerateRoute: Rota().routes(),
      ),
    );
