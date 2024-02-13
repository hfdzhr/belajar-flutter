import 'package:belajar_flutter/screens/detail_fauna_screen.dart';
import 'package:flutter/material.dart';
import '../helpers/size_helper.dart';

class ListFaunaScreen extends StatelessWidget {
  final List<Map<String, dynamic>> faunaData = [
    {
      "nama": "Fox",
      "jenis": "Carnivora",
      "desc":
          "Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae. They have a flattened skull, upright, triangular ears, a pointed, slightly upturned snout, and a long bushy tail",
      "image": "assets/img/fox.jpg"
    },
    {
      "nama": "Polar Bear",
      "jenis": "Carnivora",
      "desc":
          "The polar bear (Ursus maritimus) is a large bear native to the Arctic and nearby areas. It is closely related to the brown bear, and the two species can interbreed. The polar bear is the largest extant species of bear and land carnivore, with adult males weighing 300-800 kg (660–1,760 lb). The species is sexually dimorphic, as adult females are much smaller. The polar bear is white- or yellowish-furred with black skin and a thick layer of fat. It is more slender than the brown bear",
      "image": "assets/img/polar_bear.jpg"
    },
    {
      "nama": "Monkey",
      "jenis": "Primates",
      "desc":
          "Monkey is a common name that may refer to most mammals of the infraorder Simiiformes, also known as the simians. Traditionally, all animals in the group now known as simians are counted as monkeys except the apes, thus monkeys (in that sense) constitute an incomplete paraphyletic grouping; however, in the broader sense based on cladistics, apes (Hominoidea) are also included, making the terms monkeys and simians synonyms in regard to their scope.",
      "image": "assets/img/monkey.jpg"
    },
    {
      "nama": "Owl",
      "jenis": "Strigiformes",
      "desc":
          "Owls are birds from the order Strigiformes, which includes over 200 species of mostly solitary and nocturnal birds of prey typified by an upright stance, a large, broad head, binocular vision, binaural hearing, sharp talons, and feathers adapted for silent flight. Exceptions include the diurnal northern hawk-owl and the gregarious burrowing owl.",
      "image": "assets/img/owl.jpg"
    },
    {
      "nama": "turtle",
      "jenis": "Testudines",
      "desc":
          "Turtles are reptiles of the order Testudines, characterized by a special shell developed mainly from their ribs. Modern turtles are divided into two major groups, the Pleurodira (side necked turtles) and Cryptodira (hidden necked turtles), which differ in the way the head retracts. There are 360 living and recently extinct species of turtles, including land-dwelling tortoises and freshwater terrapins. They are found on most continents",
      "image": "assets/img/turtle.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover)),
        child: ListView.builder(
            itemCount: faunaData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailFaunaScreen(
                        nama: faunaData[index]["nama"],
                        jenis: faunaData[index]["jenis"],
                        desc: faunaData[index]["desc"],
                        image: faunaData[index]["image"],
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: displayHeight(context) * 0.25,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${faunaData[index]["image"]}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    '${faunaData[index]["nama"]} - ${faunaData[index]["jenis"]}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
