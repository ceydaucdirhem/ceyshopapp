// Gerekli paketlerin ithal edilmesi
// ignore_for_file: unused_field

import 'package:ceyshopapp/main_wrapper.dart';
import 'package:flutter/material.dart';

// RegistrationScreen adında bir StatefulWidget tanımlanıyor
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

// _RegistrationScreenState adında bir State sınıfı oluşturuluyor
class _RegistrationScreenState extends State<RegistrationScreen> {
  // FormState'i yönetmek için GlobalKey tanımlanıyor
  final _formKey = GlobalKey<FormState>();
  // Kullanıcının kayıt bilgilerini saklamak için değişkenler tanımlanıyor
  late String _email, _password, _fullName, _phoneNumber, _address, _birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Üst kısımda bir AppBar oluşturuluyor
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),
      // Kayıt formunu içeren bir Container oluşturuluyor
      body: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        // Form widget'ı oluşturuluyor ve _formKey ile ilişkilendiriliyor
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Ad Soyad girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Ad Soyad'),
                // Ad Soyad doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen adınızı ve soyadınızı giriniz';
                  }
                  return null;
                },
                // Ad Soyad değeri kaydediliyor
                onSaved: (value) => _fullName = value!,
              ),
              // E-Posta girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Posta'),
                // E-Posta doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen e-postanızı giriniz';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi giriniz';
                  }
                  return null;
                },
                // E-Posta değeri kaydediliyor
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
              // Telefon Numarası girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefon Numarası'),
                keyboardType: TextInputType.phone,
                // Telefon Numarası doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen telefon numaranızı giriniz';
                  }
                  return null;
                },
                // Telefon Numarası değeri kaydediliyor
                onSaved: (value) => _phoneNumber = value!,
              ),
              // Adres girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Adres'),
                // Adres doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen adresinizi giriniz';
                  }
                  return null;
                },
                // Adres değeri kaydediliyor
                onSaved: (value) => _address = value!,
              ),
              // Doğum Tarihi girişi için TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Doğum Tarihi (GG.AA.YYYY)'),
                // Doğum Tarihi doğrulama işlemleri
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen doğum tarihinizi giriniz';
                  } else if (!RegExp(r'^\d{2}\.\d{2}.\d{4}$').hasMatch(value)) {
                    return 'Geçerli bir tarih formatı giriniz (GG.AA.YYYY)';
                  }
                  return null;
                },
                // Doğum Tarihi değeri kaydediliyor
                onSaved: (value) => _birthDate = value!,
              ),
              // Boşluk için SizedBox kullanılıyor
              SizedBox(height: 20),
              // Kayıt ol butonu
              ElevatedButton(
                onPressed: () {
                  // Form doğrulama ve kaydetme işlemleri
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Başarılı kayıt mesajı gösteriliyor
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Başarıyla kayıt oldunuz'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // Kayıt başarılıysa MainWrapper sayfasına yönlendiriliyor
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainWrapper()),
                    );
                  }
                },
                child: Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
