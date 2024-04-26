import 'package:flutter/material.dart';
import 'package:moonbowapp/HomeScreen.dart';
import 'package:moonbowapp/Profile.dart';
import 'package:moonbowapp/SepeteEkle.dart';

import 'erkektaki.dart';
import 'kadinkolye.dart';

void main() {
  runApp(KadinBileklik());
}

class KadinBileklik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoonbowApp',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MoonbowApp'),
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
                  (index) => KadinBileklikProductCard(
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
    name: 'Cartier',
    price: 199.99,
    imagePath: 'assets/images/Bileklik1.png',
  ),
  Product(
    name: 'Ajda',
    price: 149.99,
    imagePath: 'assets/images/Bileklik2.png',
  ),
  Product(
    name: 'Pandora',
    price: 99.99,
    imagePath: 'assets/images/Bileklik3.png',
  ),
  Product(
    name: 'Swarovski',
    price: 149.99,
    imagePath: 'assets/images/Bileklik4.png',
  ),
  Product(
    name: 'Nomination',
    price: 99.99,
    imagePath: 'assets/images/Bileklik5.png',
  ),
  Product(
    name: 'Zincir',
    price: 149.99,
    imagePath: 'assets/images/Bileklik6.png',
  ),
  Product(
    name: 'Örgü',
    price: 99.99,
    imagePath: 'assets/images/bileklik7.png',
  ),
  Product(
    name: 'İnci',
    price: 149.99,
    imagePath: 'assets/images/Bileklik8.png',
  ),
  // Diğer ürünler buraya eklenebilir
];

class KadinBileklikProductCard extends StatelessWidget {
  final Product product;
  final double imageSize = 140.0;

  const KadinBileklikProductCard({
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
