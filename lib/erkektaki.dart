import 'package:flutter/material.dart';
import 'package:moonbowapp/kadinbileklik.dart';
import 'package:moonbowapp/kadinkolye.dart';

import 'HomeScreen.dart';

import 'Profile.dart';
import 'SepeteEkle.dart';

void main() {
  runApp(ErkekTaki());
}

class ErkekTaki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoonbowApp',
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Moonbow-App'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Arama işlemi burada yapılabilir
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategoriler',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Kategoriler sayfasına gitme işlemi burada yapılabilir
                    },
                    child: Text(
                      'Tümünü Gör',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    title: 'Erkek Takı',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ErkekTaki(),
                        ),
                      );
                      // Erkek takı sayfasına gitme işlemi burada yapılabilir
                    },
                  ),
                  CategoryCard(
                    title: 'Kadın Kolye',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KadinKolye(),
                        ),
                      );
                      // Kadın kolye sayfasına gitme işlemi burada yapılabilir
                    },
                  ),
                  CategoryCard(
                    title: 'Kadın Bileklik',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => KadinBileklik(),
                        ),
                      );
                      // Kadın bileklik sayfasına gitme işlemi burada yapılabilir
                    },
                  ),
                  // Diğer kategoriler buraya eklenebilir
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                physics: ClampingScrollPhysics(),
                children: List.generate(
                  products.length,
                  (index) => ErkekTakiProductCard(
                    product: products[index],
                  ),
                ),
              ),
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
                icon: Icon(Icons.shopping_cart,
                    color: Theme.of(context).hintColor),
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
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: InkWell(
          onTap:
              onPressed, // Kategorilere tıklandığında onPressed fonksiyonu çalışacak
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

final List<Product> products = [
  Product(
    name: 'Rolex Bileklik',
    price: 199.99,
    imagePath: 'assets/images/Erkek1.png',
  ),
  Product(
    name: 'Cartier',
    price: 149.99,
    imagePath: 'assets/images/Erkek2.png',
  ),
  Product(
    name: 'Zincir',
    price: 99.99,
    imagePath: 'assets/images/Erkek3.png',
  ),
  Product(
    name: 'Versace Kolye',
    price: 149.99,
    imagePath: 'assets/images/Erkek4.png',
  ),
  Product(
    name: 'Küpe',
    price: 99.99,
    imagePath: 'assets/images/Erkek5.png',
  ),
  Product(
    name: 'Haç Kolye',
    price: 149.99,
    imagePath: 'assets/images/Erkek6.png',
  ),
  Product(
    name: 'Piercing',
    price: 99.99,
    imagePath: 'assets/images/Erkek7.png',
  ),
  Product(
    name: 'Yüzük',
    price: 149.99,
    imagePath: 'assets/images/Erkek8.png',
  ),
  // Diğer ürünler buraya eklenebilir
];

class ErkekTakiProductCard extends StatelessWidget {
  final Product product;
  final double imageSize = 140.0;

  const ErkekTakiProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 73,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Sepete ekleme işlemi burada yapılabilir
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
