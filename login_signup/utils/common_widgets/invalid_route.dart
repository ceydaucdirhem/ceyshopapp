import 'package:flutter/material.dart';

import '../../values/app_strings.dart';

class InvalidRoute extends StatelessWidget {
  const InvalidRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          AppStrings.uhOhPageNotFound, // Sayfa bulunamadı hatası metni
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Metin stilini belirler
        ),
      ),
    );
  }
}
