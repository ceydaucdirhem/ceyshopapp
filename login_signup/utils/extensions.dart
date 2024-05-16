import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // Yükseklik oranını belirtilen boyut kesir miktarına göre hesaplar
  double heightFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).height * sizeFraction;

  // Genişlik oranını belirtilen boyut kesir miktarına göre hesaplar
  double widthFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).width * sizeFraction;
}
