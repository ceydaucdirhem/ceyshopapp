import 'package:ceyshopapp/screens/place_order_completed.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool validateInputs() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Ödeme',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.user,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Adres Bilgileri',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'Ad',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Soyad',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Telefon Numarası',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ödeme Yöntemleri',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              color: Colors.blue,
              child: ListTile(
                title: Text('Kapıda Kredi Kartı/Nakit'),
                trailing: Icon(Icons.credit_card),
                selected: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validateInputs()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceOrderCompletedPage()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Hata'),
                      content: Text('Lütfen tüm alanları doldurun.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Tamam'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Ödemeyi Tamamla'),
            )
          ],
        ),
      ),
    );
  }
}
