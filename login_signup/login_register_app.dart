import 'package:flutter/material.dart';

import 'routes.dart';
import 'utils/helpers/navigation_helper.dart';
import 'utils/helpers/snackbar_helper.dart';
import 'values/app_routes.dart';
import 'values/app_strings.dart';
import 'values/app_theme.dart';

class LoginRegisterApp extends StatelessWidget {
  const LoginRegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hata ayıklama banner'ını gizler
      title: AppStrings.loginAndRegister, // Uygulama başlığı
      theme: AppTheme.themeData, // Tema verileri
      initialRoute: AppRoutes.login, // Başlangıç rotası
      scaffoldMessengerKey: SnackbarHelper.key, // ScaffoldMessenger anahtarı
      navigatorKey: NavigationHelper.key, // Navigator anahtarı
      onGenerateRoute: Routes.generateRoute, // Rota oluşturma işlevi
    );
  }
}
