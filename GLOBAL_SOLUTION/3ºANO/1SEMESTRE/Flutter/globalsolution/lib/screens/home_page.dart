import 'package:flutter/material.dart';
import 'package:globalsolution/screens/galery_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _imageList = [
    'assets/images/carrossel1.jpg',
    'assets/images/carrossel2.jpg',
    'assets/images/carrossel3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HOME'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Revolução na Agricultura',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Padding( 
                  padding: const EdgeInsets.all(16.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: _imageList.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(200, 50)
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const GaleryPage())
                      );
                    },
                    child: const Text('Galeria'),
                  ),
                ),
              ],
            )
          ),
        )
      ),
    );
  }
}
