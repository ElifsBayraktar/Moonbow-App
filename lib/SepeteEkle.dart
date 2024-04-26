import 'package:flutter/material.dart';

// Örnek bir ürün sınıfı
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sepet Ekleme Sayfası',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sepet(),
    );
  }
}

class Sepet extends StatefulWidget {
  @override
  _SepetState createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  List<Product> _products = [
    Product(name: 'Rolex Bileklik', price: 149),
    Product(name: 'İnci Kolye', price: 99.0),
    Product(name: 'Nomination', price: 99.0),
  ];

  List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepet Ekleme Sayfası'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} TL'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => _addToCart(product),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Sepeti göster
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SepetSayfasi(cart: _cart)),
          );
        },
        label: Text('Sepete Git'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class SepetSayfasi extends StatelessWidget {
  final List<Product> cart;

  const SepetSayfasi({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var product in cart) {
      totalPrice += product.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sepet'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} TL'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Toplam: ${totalPrice.toStringAsFixed(2)} TL',
                style: TextStyle(fontSize: 13),
              ),
              ElevatedButton(
                onPressed: () {
                  // Sepeti boşalt
                  Navigator.pop(context);
                },
                child: Text('Sepeti Boşalt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
