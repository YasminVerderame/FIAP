import 'package:flutter/material.dart';
import 'package:globalsolution/screens/image_details_page.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  // final list = itensListMock;

  final List<String> images = [
    'assets/images/milho.jpeg',
    'assets/images/arroz.jpeg',
    'assets/images/plantacao.png',
    'assets/images/platacao-soja.jpg',
    'assets/images/algodao.png',
    'assets/images/drone1.png',
    'assets/images/pexels-mark-stebnicki-3610586.jpg',
    'assets/images/pexels-ferdie-drone-15203622.jpg',
    'assets/images/pexels-tom-fisk-1595104.jpg',
    'assets/images/pexels-tom-fisk-10849313.jpg'
  ];

  final List<String> id = [
    'ID: 897502078675',
    'ID: 195515435616',
    'ID: 757378312079',
    'ID: 972383560887',
    'ID: 986756437070',
    'ID: 173765906806',
    'ID: 064774990423',
    'ID: 098756424775',
    'ID: 595420789653',
    'ID: 983764514784',
  ];

  final List<String> name = [
    'Plantação de Milho',
    'Plantação de Arroz',
    'Plantação de Laranja',
    'Plantação de Soja',
    'Plantação de Algodão',
    'Plantação de Algodão',
    'Plantação de Melancia',
    'Plantação de Uva',
    'Plantação de Café',
    'Plantação de Trigo',
  ];

  final List<String> description = [
    'A plantação de milho é uma bela paisagem agrícola, com campos vastos e plantas altas. Os agricultores cuidam das plantas com atenção, garantindo solo fértil e água adequada. O milho amadurece em espigas douradas, que são colhidas e utilizadas como alimento e ingredientes diversos. Essa plantação simboliza o trabalho árduo e a recompensa da colheita.',
    'A plantação de laranja é uma paisagem vibrante e colorida, com árvores carregadas de frutas maduras. O aroma cítrico perfuma o ar e convida a um passeio pelos caminhos sombreados. As folhas verdes brilhantes dançam com a brisa enquanto os raios de sol iluminam os frutos dourados. O sabor suculento e doce das laranjas enche a boca, representando a abundância da natureza e o trabalho dedicado dos agricultores.',
    'A plantação de soja é uma paisagem vibrante e cheia de vida, com campos extensos e plantas verdes exuberantes. O aroma suave e doce da soja perfuma o ar, enquanto as folhas balançam com a brisa. O solo macio cria uma sensação reconfortante a cada passo. A plantação de soja é uma mistura de cores, com o verde das plantas contrastando com o solo. À medida que as plantas amadurecem, as vagens douradas indicam uma colheita abundante. Essa plantação representa a importância da soja na alimentação e no desenvolvimento sustentável, destacando a habilidade dos agricultores em cultivar essa cultura versátil.',
    'A plantação de algodão é um cenário encantador, com fileiras perfeitas de plantas que criam um tapete branco e macio. O aroma suave e doce permeia o ar, enquanto as plantas balançam com a brisa. O algodão em si é uma maravilha, com suas fibras brilhantes prontas para serem colhidas e transformadas em tecidos confortáveis. O trabalho árduo dos agricultores é evidente em cada detalhe, desde o preparo do solo até o cuidado com as plantas, resultando em uma das matérias-primas mais valiosas do mundo.',
    'A plantação de algodão é um cenário encantador e branco. Os campos se estendem em fileiras perfeitas, com as plantas de algodão balançando suavemente ao vento. O ar é preenchido com um aroma suave e doce, enquanto os agricultores trabalham com dedicação. O algodão em crescimento apresenta suas delicadas e brilhantes fibras, prontas para serem colhidas e transformadas em tecidos confortáveis. A plantação de algodão é um símbolo da tradição agrícola e do esforço humano para criar uma das matérias-primas mais valiosas do mundo.',
    'A plantação de melancia é uma visão refrescante e vibrante. Os campos se estendem em extensões verdejantes, com fileiras de videiras robustas e exuberantes. O ar está impregnado com um aroma doce e suculento que evoca a chegada do verão. As folhas grandes e brilhantes balançam suavemente, criando sombras agradáveis. À medida que as melancias amadurecem, manchas verdes escuras se transformam em um verde vibrante, revelando a promessa de frutas doces e refrescantes. A plantação de melancia é um testemunho do trabalho diligente dos agricultores e da recompensa saborosa que a natureza oferece. É um lugar onde se pode desfrutar de momentos de satisfação ao saborear a polpa suculenta e suculenta dessas frutas tão adoradas no calor do verão.',
    'A plantação de uva é uma cena encantadora e cheia de vida. Os vinhedos se estendem em colinas suaves, com videiras carregadas de cachos de uvas maduras. O aroma suave e adocicado das uvas preenche o ar, convidando para um passeio entre as fileiras de plantas. As folhas verdes exibem uma beleza delicada, dançando suavemente com a brisa. À medida que as uvas amadurecem, sua cor e sabor se intensificam, revelando uma variedade de tons vibrantes, desde o verde até o roxo profundo. A plantação de uva é um testemunho da dedicação dos viticultores e da paixão pela produção de vinhos e sucos deliciosos. É um lugar que reflete a harmonia entre a natureza e o trabalho humano, resultando em uma das frutas mais apreciadas e versáteis que enriquecem nosso paladar.',
    'A plantação de café é um cenário mágico e acolhedor, onde os sentidos são despertados pelos deliciosos aromas de cacau, caramelo e frutas maduras. Os cafeeiros se estendem harmoniosamente, com folhas brilhantes criando sombras suaves no chão. O ar está cheio de expectativa e paixão, pois cada árvore promete grãos saborosos. Pequenos botões brancos surgem nos ramos, indicando as futuras cerejas de café. Os agricultores colhem com dedicação, cultivando uma das preciosidades mais apreciadas - o café aromático e revigorante que nos envolve com suas notas complexas.',
    'A plantação de trigo é uma visão tranquila e serena. Os vastos campos se estendem até o horizonte, onde fileiras de trigo ondulam suavemente com a brisa. O ar está impregnado com um aroma suave e reconfortante. O solo fértil e macio sob os pés oferece uma sensação reconfortante ao caminhar pelos campos. O trigo em crescimento cria uma paleta de tons dourados e amarelados, que se destaca contra o céu azul. À medida que a estação avança, as espigas se formam, revelando a promessa de uma colheita abundante. A plantação de trigo é um testemunho da dedicação dos agricultores e da importância desse cereal versátil, fundamental para a produção de alimentos básicos em todo o mundo.',
  ];

  final List<String> date = [
    '19/04/2023',
    '22/06/2023',
    '07/03/2023',
    '19/03/2023',
    '09/02/2023',
    '20/09/2022',
    '15/05/2023',
    '02/09/2022',
    '30/05/2023',
    '18/12/2022',
  ];

  final List<String> nameHistoric = [
    'Yasmin',
    'Vinicius',
    'Gabriel',
    'Maria',
    'Gerson',
    'Cleiton',
    'Priscilla',
    'Ricardo',
    'Vanessa',
    'Marcelo',
  ];

  final List<String> descriptionHistoric= [
    'Jogou pesticida',
    'Irrigação com 16% de umidade',
    'Controle da acidez do solo',
    'JAdubação com enxofre',
    'Irrigação 2x ao dias',
    'Jogou pesticida na plantação',
    'Controle da temperatura',
    'Implementação de quebra-vento',
    'Adubação e irrigação',
    'Controle de umidade do solo',
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Galeria'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailsPage(
                    image: images[index],
                    id: id[index],
                    name: name[index],
                    description: description[index],
                    date: date[index],
                    nameHistoric: nameHistoric[index],
                    descriptionHistoric: descriptionHistoric[index]
                  ),
                ),
              );
            },
            
            child: Column(
              children: [
                Image.network(
                  images[index],
                  width: 700,),
                Padding(padding: const EdgeInsets.all(10.0),
                  child: Text(
                    id[index],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ), 
              ],
            ),
          );
        },
      ),
    );
  }
}

