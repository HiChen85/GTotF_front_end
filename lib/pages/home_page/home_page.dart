import 'package:flutter/material.dart';
import 'package:graph_theory_matching_game/pages/home_page/scene_view.dart';
import 'package:graph_theory_matching_game/style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Matching Game")),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: bgImg,
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                buildHomeInfo(width * webScale),
                const SizedBox(height: 15),
                const SceneView(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildHomeInfo(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: defaultGradient,
      ),
      child: Wrap(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Happy Home Introduction",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Our farmer friends Karl, Otto, Jim, Laura and Martin each want to buy a new animal for their farm, but they only have certain types of food available – so they have to make sure they choose a type of animal which likes at least one of these foods. Can you help the farmers work out who should buy which animal?",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Below are seven scenarios describing what the different animals like to eat, and what kinds of food each farmer has. In each case, can you find a way to match up exactly one animal with each farmer? If not, why not?",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Game Rules",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "1.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text:
                        """ The players will be given several animal cards on the left and right, which contains the food that animals eat. The players need to match their cards to the farmers aligned at the center, who have foods the animals want to eat. """,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "2.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text:
                        " Each animal has a specific score. The players cannot see which animal each farmer has, they have to do matching in turn. If one player match his animal to the farmer who doesn't have animal, the animal and the farmer will be connected with a line, the player will get the corresponding score and the animal and the farmer then cannot be matched any more. If the player connects his animal to the farmer who has had the animal, the animal won't be connected and his turn end.",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "3.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " When an animal is matched, your opponent also needs to drop the same animal in his hand. Repeat this process until the game ends.",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "4.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text: " Each farmer can only have one animal. The game ends when all farmers have a animal in their home.",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
