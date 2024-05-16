import 'package:ceyshopapp/login_signup/screens/login_screen.dart';
import 'package:flutter/material.dart';


import 'screens/register_screen.dart';
import 'utils/common_widgets/invalid_route.dart';
import 'values/app_routes.dart';

class Routes {
  const Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(widget:  LoginScreen());

      case AppRoutes.register:
        return getRoute(widget:  RegistrationScreen());

      /// Geçersiz bir rota. Kullanıcı bunu görmemeli,
      /// sadece hata ayıklama amaçlıdır.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
