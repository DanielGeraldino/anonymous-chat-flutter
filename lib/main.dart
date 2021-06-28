import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/rota.dart';

main() => runApp(
      MaterialApp(
          initialRoute: Rota.splash,
          routes: Rota.rotas,
          onGenerateRoute: (config) {
            print(config.name);
          },
          builder: EasyLoading.init()),
    );
