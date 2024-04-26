import 'package:flutter/material.dart';
import 'package:moonbowapp/erkektaki.dart';
import 'package:moonbowapp/kadinbileklik.dart';
import 'package:moonbowapp/kadinkolye.dart';

import 'Profile.dart';
import 'SepeteEkle.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moonbow-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moonbow-App'),
      ),
      body: ListView(
        children: [
          // Ürün kartları burada listelenebilir
          ProductCard(
            productName: 'Erkek Takı',
            imagePath: 'assets/images/Erkek9.png',
            destinationPage: ErkekTaki(), // Erkek takı sayfası
          ),
          ProductCard(
            productName: 'Kadın Kolye',
            imagePath: 'assets/images/Kolye1.png',
            destinationPage: KadinKolye(), // Kadın kolye sayfası
          ),
          ProductCard(
            productName: 'Kadın Bileklik',
            imagePath: 'assets/images/Bileklik9.png',
            destinationPage: KadinBileklik(), // Kadın bileklik sayfası
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Theme.of(context).hintColor),
              onPressed: () {
                // Ana sayfaya gitme işlemi burada yapı
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
                // Kadın bileklik sayfasına gitme işlemi burada yapılabilir
              },
            ),
            IconButton(
              icon:
                  Icon(Icons.shopping_cart, color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Sepet(),
                  ),
                );
                // Sepete gitme işlemi burada yapılabilir
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Profile(),
                  ),
                );
                // Profil sayfasına gitme işlemi
                // burada yapılabilir
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String imagePath;
  final Widget destinationPage; // Yönlendirilecek sayfa

  const ProductCard({
    Key? key,
    required this.productName,
    required this.imagePath,
    required this.destinationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4, // Kartın gölge miktarını ayarlar
      child: InkWell(
        onTap: () {
          // İlgili sayfaya gitme işlemi
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                productName,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
