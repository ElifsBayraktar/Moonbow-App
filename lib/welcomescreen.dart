import 'package:flutter/material.dart';

import 'loginscreen.dart';

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _splashscreenState createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 225,
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 1), // Butonlar arasında boşluk ekleyin
          Container(
            height: 53,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                } else {
                  _controller.animateToPage(
                    2, // 3. sayfa indeksi
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class UnbordingContent {
  String image;
  String title;

  UnbordingContent({
    required this.image,
    required this.title,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Quality Service',
    image: 'assets/images/splash1.png',
  ),
  UnbordingContent(
    title: 'Super Speed',
    image: 'assets/images/splash2.png',
  ),
  UnbordingContent(
    title: 'Secure Shopping',
    image: 'assets/images/splash3.png',
  ),
];
