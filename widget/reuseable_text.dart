import 'package:flutter/material.dart';



class ReuseableText extends StatelessWidget {
  const ReuseableText({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        text: "₺",
        style: textTheme.subtitle2?.copyWith(
          fontSize: 21,
           color:const Color.fromARGB(255, 247, 128, 168),
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: price.toString(),
            style: textTheme.subtitle2?.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
