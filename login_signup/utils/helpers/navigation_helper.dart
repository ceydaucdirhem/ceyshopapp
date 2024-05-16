import 'package:flutter/material.dart';

class NavigationHelper {
  const NavigationHelper._(); // Kurucu fonksiyonu gizler

  static final _key = GlobalKey<NavigatorState>(); // Navigator'ün anahtarını oluşturur

  static GlobalKey<NavigatorState> get key => _key; // Navigator'ün anahtarını döndürür

  // Belirtilen rotaya geçiş yapar
  static Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _key.currentState?.pushNamed<T?>(
      routeName,
      arguments: arguments,
    );
  }

  // Geçerli rotayı belirtilen rota ile değiştirir
  static Future<T?>? pushReplacementNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _key.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  // Geçerli rotadan çıkar ve önceki rotaya döner
  static void pop<T extends Object?>([T? result]) {
    return _key.currentState?.pop(result);
  }
}
