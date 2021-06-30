import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/rota.dart';

main() => runApp(
      MaterialApp(
        builder: EasyLoading.init(),
        onGenerateRoute: Rota().routes(),
      ),
    );
