import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import '../extensions.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    required this.children,
    this.colors = AppColors.defaultGradient,
    super.key,
  });

  final List<Color> colors; // Arka plan gradientinin renkleri
  final List<Widget> children; // Arka planın içinde bulunan widget'lar

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: colors)), // Gradient arka planı oluşturur
      child: Padding(
        padding: const EdgeInsets.all(20), // Arka plan içeriğinin etrafındaki boşluk
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: context.heightFraction(sizeFraction: 0.1), // Arka planın yüksekliğinin bir kısmı kadar boşluk ekler
            ),
            ...children, // Arka planın içindeki widget'lar
          ],
        ),
      ),
    );
  }
}
