import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_register_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Uygulama başlatıldığında Flutter bağlamını başlatır
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light), // Bildirim çubuğu ikonlarının parlaklığını ayarlar
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const LoginRegisterApp()), // Uygulamayı başlatır
  );
}
