// Gerekli paketlerin ithal edilmesi
// ignore_for_file: unused_field

import 'package:ceyshopapp/login_signup/screens/register_screen.dart';
import 'package:ceyshopapp/main_wrapper.dart';
import 'package:flutter/material.dart';

// LoginScreen adında bir StatefulWidget tanımlanıyor
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// _LoginScreenState adında bir State sınıfı oluşturuluyor
class _LoginScreenState extends State<LoginScreen> {
  // FormState'i yönetmek için GlobalKey tanımlanıyor
  final _formKey = GlobalKey<FormState>();
  // Kullanıcının e-posta ve şifre bilgilerini saklamak için değişkenler tanımlanıyor
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Üst kısımda bir AppBar oluşturuluyor
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      // Giriş formunu içeren bir Container oluşturuluyor
      body: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        // Form widget'ı oluşturuluyor ve _formKey ile ilişkilendiriliyor
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Boşluk için SizedBox kullanılıyor
              SizedBox(width: 10),
              // E-posta girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Posta'),
                // E-posta doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen e-postanızı giriniz';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi giriniz';
                  }
                  return null;
                },
                // E-posta değeri kaydediliyor
                onSaved: (value) => _email = value!,
              ),
              // Şifre girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                // Şifre doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen şifrenizi giriniz';
                  }
                  return null;
                },
                // Şifre değeri kaydediliyor
                onSaved: (value) => _password = value!,
              ),
              // Boşluk için SizedBox kullanılıyor
              SizedBox(height: 20),
              // Giriş yap butonu
              ElevatedButton(
                onPressed: () {
                  // Form doğrulama ve kaydetme işlemleri
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Başarılı giriş mesajı gösteriliyor
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Başarıyla giriş yaptınız'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // Giriş başarılıysa MainWrapper sayfasına yönlendiriliyor
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainWrapper()),
                    );
                  }
                },
                child: Text('Giriş Yap'),
              ),
              // Boşluk için SizedBox kullanılıyor
              SizedBox(height: 20),
              // Kayıt olma sayfasına yönlendiren TextButton
              TextButton(
                onPressed: () {
                  // RegistrationScreen sayfasına yönlendiriliyor
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Hesabın yok mu? Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
