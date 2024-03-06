import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  final String image;
  final String id;
  final String name;
  final String description;
  final String date;
  final String nameHistoric;
  final String descriptionHistoric;

 const ImageDetailsPage({required this.image, required this.id, required this.description, required this.name, required this.date, required this.nameHistoric, required this.descriptionHistoric});
 //colocar scroll
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalhes da imagem'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.network(image, fit: BoxFit.cover,),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    id,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Nome: $name',
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    description,           
                    style: const TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child:const Divider(
                      color: Colors.lightGreen,
                      height: 36,
                    )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Histórico da plantação',         
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox( 
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          date,           
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          nameHistoric,           
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          descriptionHistoric,           
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}