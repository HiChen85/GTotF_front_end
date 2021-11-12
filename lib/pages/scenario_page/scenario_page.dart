import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_theory_matching_game/data/scenarios_data.dart';
import 'package:graph_theory_matching_game/game_canvas/game_canvas.dart';
import 'package:graph_theory_matching_game/style/style.dart';

class SceneDetail extends StatefulWidget {
  const SceneDetail({Key? key}) : super(key: key);

  @override
  _SceneDetailState createState() => _SceneDetailState();
}

class _SceneDetailState extends State<SceneDetail> {
  late ValueNotifier<int> maximum = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    maximum.value = int.parse(Get.arguments['maximum']);

    // this controls which scenario should be shown
    final index = int.parse(Get.parameters['id']!);
    // get the description of the scenario
    final detail = scenarios["scenario${index + 1}"]['detail'];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Scenario ${index + 1}'),
      ),
      body: Container(
        width: width,
        height: height,
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
                // Scenario info
                buildSceneIntro(width * webScale, detail),
                const SizedBox(height: 15),
                // Game Canvas
                GameCanvas(
                  width: width < 500 ? width * mobileScale : width * webScale,
                  height: height,
                  index: index,
                  maximum: maximum,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildSceneIntro(double width, detail) {
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
              'Scenario Introduction',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              detail,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
