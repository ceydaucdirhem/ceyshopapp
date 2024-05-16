import 'package:ceyshopapp/main_wrapper.dart';
import 'package:flutter/material.dart';

class PlaceOrderCompletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sipariş Tamamlandı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Siparişiniz Başarıyla Tamamlandı',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainWrapper()),
                    );
                  },
                  child: Text('Anasayfaya git'),
                )
          ],
        ),
      ),
    );
  }
}
