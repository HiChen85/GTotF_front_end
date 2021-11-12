import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_theory_matching_game/data/scenarios_data.dart';
import 'package:graph_theory_matching_game/game_canvas/animal_card.dart';
import 'package:graph_theory_matching_game/game_dialog/game_dialog.dart';
import 'package:graph_theory_matching_game/style/style.dart';

import 'game_painter.dart';

class GameCanvas extends StatefulWidget {
  const GameCanvas({
    Key? key,
    required this.width,
    required this.height,
    required this.index,
    required this.maximum,
  }) : super(key: key);

  final double width;
  final double height;
  final int index;
  final ValueNotifier<int> maximum;

  @override
  State<GameCanvas> createState() => _GameCanvasState();
}

class _GameCanvasState extends State<GameCanvas> {
  late List<String> animals;
  late List<String> farmers;
  late Map<String, int> score;
  // to listen the result from back-end
  late ValueNotifier<int> maximum;

  //Keys
  List<GlobalKey>? leftKeys;
  List<GlobalKey>? rightKeys;
  List<GlobalKey>? farmerKeys;

  Map<String, String> home = {};

  int leftPlayerScore = 0;
  int rightPlayerScore = 0;

  // fails reason
  int fails = 0;

  // used to represent the player: 0 is the leftPlayer, 1 is the rightPlayer
  ValueNotifier whoNotifier = ValueNotifier(-1);

  // to disable Draggable
  ValueNotifier disable = ValueNotifier<String>("");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    score = scenarios['scenario${widget.index + 1}']['score'];
    animals = scenarios['scenario${widget.index + 1}']['animals'].keys.toList();
    farmers = scenarios['scenario${widget.index + 1}']['farmer'].keys.toList();
    leftKeys = List.generate(animals.length, (index) => GlobalKey());
    rightKeys = List.generate(animals.length, (index) => GlobalKey());
    farmerKeys = List.generate(farmers.length, (index) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    maximum = widget.maximum;
    return Column(
      children: [
        // show scores
        Container(
          width: widget.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: defaultGradient,
          ),
          // show scoring
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    // color: Colors.red,
                    child: Text(
                      "Score: $leftPlayerScore",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    "VS.",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    // color: Colors.red,
                    child: Text(
                      "Score: $rightPlayerScore",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // show game canvas
        Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: defaultGradient,
          ),
          child: CustomPaint(
            painter: GamePainter(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // when you want to ignore the size of child widget and want to make them be scaled according to its parent widget, you should use
                  // Row or Column widget, then wrap the child widget with Expanded Widget.
                  Expanded(
                    child: Column(
                      children: _buildLeftAnimalCard(),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: _buildFarmerCards(context, home),
                  )),
                  Expanded(
                    child: Column(
                      children: _buildRightAnimalCard(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // show buttons
        Container(
          width: widget.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // gradient: defaultGradient,
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: webButtonWidth,
                    height: webButtonHeight,
                    child: MaterialButton(
                      color: themeColor,
                      splashColor: Colors.cyanAccent,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "BACK",
                        style: TextStyle(fontSize: webButtonTextSize),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: webButtonWidth,
                    height: webButtonHeight,
                    child: MaterialButton(
                      splashColor: Colors.cyanAccent,
                      color: themeColor,
                      onPressed: () {
                        setState(() {
                          leftPlayerScore = 0;
                          rightPlayerScore = 0;
                          home = {};
                          whoNotifier.value = -1;
                          disable.value = "";
                        });
                      },
                      child: const Text(
                        "RESET",
                        style: TextStyle(fontSize: webButtonTextSize),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Row> _buildLeftAnimalCard() {
    return animals.map((animal) {
      var currentIndex = animals.indexOf(animal);
      GlobalKey key = leftKeys![currentIndex];
      return Row(
        children: [
          ..._buildAnimalEats(animal),
          Expanded(
            child: MyDraggable(key: key, animal: animal, score: score, whoNotifier: whoNotifier, disable: disable, who: 0),
          ),
        ],
      );
    }).toList();
  }

  List<Widget> _buildFarmerCards(BuildContext context, Map<String, String?> home) {
    return farmers.map((farmer) {
      var currentIndex = farmers.indexOf(farmer);
      var key = farmerKeys![currentIndex];
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: themeColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DragTarget(
              builder: (context, candidates, rejection) {
                return Container(
                  key: key,
                  width: cardContainerWidth * webScale,
                  height: cardContainerHeight * webScale,
                  margin: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/images/$farmer.png',
                    fit: BoxFit.fill,
                  ),
                );
              },
              onWillAccept: (List<dynamic>? data) {
                var count = 0;
                if (!home.containsKey(farmer)) {
                  List farmerHas = scenarios['scenario${widget.index + 1}']['farmer'][farmer];
                  List animalEats = scenarios['scenario${widget.index + 1}']['animals'][data![0]];
                  for (var has in farmerHas) {
                    if (animalEats.contains(has)) {
                      return true;
                    }
                    count++;
                  }
                  if (count == farmerHas.length) {
                    // animal dosen't want to go to someone's home, fails sets to 1;
                    fails = 1;
                    return false;
                  }
                }
                // farmer has had animals his home;
                fails = 2;
                return false;
              },
              onAccept: (List data) {
                if (whoNotifier.value == 0) {
                  leftPlayerScore += data[1] as int;
                } else if (whoNotifier.value == 1) {
                  rightPlayerScore += data[1] as int;
                }
                // 如果希望在同一个ValueNotifier 控制下的多个组件在值发生更改时同时生效,
                // 就在它们的父组件ValueNotifier 发生改变处setState 而不是在组件内刷新.
                setState(() {
                  disable.value = data[0];
                  home[farmer] = data[0];
                });
                Get.snackbar("Info", "${data[0]} goes into $farmer's home");
                print("home ${home}");
                print("left Player's score: $leftPlayerScore, right Player's score: $rightPlayerScore");

                print(maximum.value);
                print(home.length);
                if (home.length == maximum.value) {
                  print("Congratulation, Result reaches the maximum matching");

                  showGameOverDialog(context, home, "Congratulation", "Result reaches the maximum matching", leftPlayerScore, rightPlayerScore);
                  return;
                } else if (isGameOver()) {
                  print("Game is over but not reaches the maximum matching, Game is going to RESET!");
                  showGameOverDialog(context, home, "SORRY", "Game is over but not reaches the maximum matching, Game is going to RESET!", leftPlayerScore, rightPlayerScore);
                  Future.delayed(const Duration(seconds: infoTimer), () {
                    setState(() {
                      leftPlayerScore = 0;
                      rightPlayerScore = 0;
                      home.clear();
                      whoNotifier.value = -1;
                      disable.value = "";
                    });
                  });
                }
              },
              onLeave: (List? data) {
                if (fails == 1) {
                  // Get.snackbar("Info", "${data![0]} doesn't want to go to $farmer's home!");
                  showGameStatus(context, "${data![0]} doesn't want to go to $farmer's home!");
                  fails = 0;
                } else if (fails == 2) {
                  // Get.snackbar("Info", "$farmer has already had one animal!");
                  showGameStatus(context, "$farmer has already had one animal!");
                  fails = 0;
                }
                print("Info: ${data![0]} doesn't want to go to $farmer's home!");
              },
            ),
          ),
        ],
      );
    }).toList();
  }

  List<Row> _buildRightAnimalCard() {
    return animals.map((animal) {
      var currentIndex = animals.indexOf(animal);
      var key = rightKeys![currentIndex];
      return Row(
        children: [
          Expanded(
            child: MyDraggable(key: key, animal: animal, score: score, whoNotifier: whoNotifier, disable: disable, who: 1),
          ),
          ..._buildAnimalEats(animal),
        ],
      );
    }).toList();
  }

  List<Expanded> _buildAnimalEats(String animal) {
    List foods = scenarios['scenario${widget.index + 1}']['animals'][animal];
    var foodCards = foods.map((food) {
      var foodCard = Expanded(
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: themeColor),
            borderRadius: BorderRadius.circular(10),
          ),
          width: cardContainerWidth,
          height: cardContainerHeight,
          child: Image.asset(
            'assets/images/$food.png',
            fit: BoxFit.fill,
          ),
        ),
      );
      return foodCard;
    }).toList();

    if (foodCards.length < 2) {
      foodCards.add(Expanded(child: Container()));
    }
    return foodCards;
  }

  bool isGameOver() {
    print("Not get to maximum matching now...");
    // 当未达到最大匹配且无可用匹配时,游戏结束
    var farmersAvi = [];
    var animalsAvi = [];
    var getHomes = home.values.toList();
    for (var f in farmers) {
      if (!home.containsKey(f)) {
        farmersAvi.add(f);
      }
    }

    for (var a in animals) {
      // check which animal is not getting a home;
      if (!getHomes.contains(a)) {
        animalsAvi.add(a);
      }
    }
    print("Start checking home....");
    // 检查游戏是否结束
    print("Currently available farmers: $farmersAvi...");
    print("Currently available animals: $animalsAvi...");
    for (var f in farmersAvi) {
      List farmerHas = scenarios['scenario${widget.index + 1}']['farmer'][f];
      for (var a in animalsAvi) {
        List animalEats = scenarios['scenario${widget.index + 1}']['animals'][a];
        for (var has in farmerHas) {
          if (animalEats.contains(has)) {
            // 当前农民有的食物有动物爱吃, 表明游戏仍未结束
            return false;
          }
        } // 此循环结束, 表示当前农民检查了一个动物的所有爱吃的食物,发现这个动物不爱吃他有的食物, 要继续检查下一个动物
      } // 此循环结束, 表示当前农民已经检查了所有动物, 发现没有动物爱吃他的食物. 要让第二个农民来检查所有的动物是否有爱吃他食物的.
    } // 此循环结束表示所有的农民都检查了所有的动物, 发现没有动物爱吃他们的食物.
    return true;
  }
}
