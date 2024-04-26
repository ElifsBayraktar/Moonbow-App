import 'package:flutter/material.dart';
import 'package:moonbowapp/SepeteEkle.dart';

import 'HomeScreen.dart'; // CartScreen import edilmeli

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.deepPurple,
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/Erkek9.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'kullanici',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'kullanici@gmail.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Hesap Bilgileri'),
              onTap: () {
                // Hesap bilgileri sayfasına gitme işlemi burada yapılabilir
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Siparişlerim'),
              onTap: () {
                // Siparişlerim sayfasına gitme işlemi burada yapılabilir
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Ödemelerim'),
              onTap: () {
                // Ödemelerim sayfasına gitme işlemi burada yapılabilir
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorilerim'),
              onTap: () {
                // Favorilerim sayfasına gitme işlemi burada yapılabilir
              },
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sepet()),
                );
              },
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
