import 'package:flutter/material.dart';

class SnackbarHelper {
  const SnackbarHelper._(); // Kurucu fonksiyonu gizler

  static final _key = GlobalKey<ScaffoldMessengerState>(); // ScaffoldMessenger'ın anahtarını oluşturur

  static GlobalKey<ScaffoldMessengerState> get key => _key; // ScaffoldMessenger'ın anahtarını döndürür

  // Bir SnackBar gösterir
  static void showSnackBar(String? message, {bool isError = false}) =>
      _key.currentState // ScaffoldMessenger'ı kontrol eder
        ?..removeCurrentSnackBar() // Varolan SnackBar'ı kaldırır
        ..showSnackBar(
          SnackBar(
            content: Text(message ?? ''), // SnackBar içeriği
          ),
        );
}
