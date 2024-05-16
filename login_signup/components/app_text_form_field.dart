import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.textInputAction,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    super.key,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.onEditingComplete,
    this.autofocus,
    this.focusNode,
  });

  final void Function(String)? onChanged; // Metin alanı değeri değiştiğinde tetiklenen fonksiyon
  final String? Function(String?)? validator; // Doğrulama fonksiyonu
  final TextInputAction textInputAction; // Metin alanında klavye işlem düğmesine basıldığında ne olacağını belirler
  final TextInputType keyboardType; // Metin alanının klavye türü
  final TextEditingController controller; // Metin alanının denetleyicisi
  final bool? obscureText; // Metin alanındaki metnin gizli olup olmadığını belirler
  final Widget? suffixIcon; // Metin alanının sonunda görüntülenecek simge
  final String labelText; // Metin alanının etiketi
  final bool? autofocus; // Metin alanının otomatik olarak odaklanıp odaklanmayacağını belirler
  final FocusNode? focusNode; // Metin alanının odak noktası
  final void Function()? onEditingComplete; // Metin alanında düzenleme tamamlandığında çağrılan fonksiyon

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        validator: validator,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          suffixIcon: suffixIcon, // Sonek ikonu
          labelText: labelText, // Etiket metni
          floatingLabelBehavior: FloatingLabelBehavior.always, // Sürekli yüzen etiket davranışı
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(), // Dışarı tıklandığında odaklanmayı kaldırır
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
