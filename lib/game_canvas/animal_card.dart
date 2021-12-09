import 'package:flutter/material.dart';
import 'package:graph_theory_matching_game/style/style.dart';

class MyDraggable extends StatefulWidget {
  final String animal;
  final Map<String, int> score;
  final ValueNotifier whoNotifier;
  final int who;
  final ValueNotifier disable;
  const MyDraggable({Key? key, required this.animal, required this.score, required this.whoNotifier, required this.who, required this.disable}) : super(key: key);

  @override
  _MyDraggableState createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  late GlobalKey key;
  late String animal;
  late Map<String, int> score;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    key = widget.key as GlobalKey;
    score = widget.score;
    animal = widget.animal;
  }

  var isDrag = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.animal == widget.disable.value) {
      isDrag = 0;
    }
    if (widget.disable.value == "") {
      isDrag = 1;
    }
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: themeColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Draggable(
        child: SizedBox(
          width: cardContainerWidth,
          height: cardContainerHeight,
          child: Image.asset(
            'assets/images/$animal.png',
            fit: BoxFit.fill,
          ),
        ),
        feedback: SizedBox(
          width: cardContainerWidth * webScale,
          height: cardContainerHeight * webScale,
          child: Image.asset(
            'assets/images/$animal.png',
            fit: BoxFit.fill,
          ),
        ),
        data: [animal, score[animal]],
        maxSimultaneousDrags: isDrag,
        childWhenDragging: Center(child: Text("Being Dragged", style: TextStyle(fontSize: 15, color: themeColor))),
        onDragStarted: () {
          widget.whoNotifier.value = widget.who;
        },
      ),
    );
  }
}
