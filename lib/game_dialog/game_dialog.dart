import 'package:flutter/material.dart';
import 'package:graph_theory_matching_game/style/style.dart';

void showGameOverDialog(BuildContext context, Map home, String title, String info, int leftScore, int rightScore) {
  var information = Text(
    info,
    style: TextStyle(fontSize: dialogInfoSize, color: themeColor),
  );
  var scores = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        "Score: $leftScore",
        style: TextStyle(fontSize: dialogScoreSize, fontWeight: FontWeight.bold, color: themeColor),
      ),
      Text(
        "Score: $rightScore",
        style: TextStyle(fontSize: dialogScoreSize, fontWeight: FontWeight.bold, color: themeColor),
      ),
    ],
  );
  List<Widget> content = [information, const SizedBox(height: 15), scores];
  home.forEach((farmer, animal) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.asset(baseImgUrl + "$farmer.png", fit: BoxFit.fill),
        ),
        const Center(
          child: Text("--------------->", style: TextStyle(fontSize: 30)),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.asset(baseImgUrl + "$animal.png", fit: BoxFit.fill),
        ),
      ],
    );
    content.add(row);
  });
  showAboutDialog(
    context: context,
    applicationName: title,
    applicationIcon: const FlutterLogo(
      size: 50,
      textColor: Colors.pinkAccent,
    ),
    children: content,
  );
}

void showGameStatus(BuildContext context, String info) {
  showAboutDialog(
    context: context,
    applicationName: "INFO:",
    applicationIcon: const FlutterLogo(
      textColor: Colors.pinkAccent,
      size: 50,
    ),
    children: [Center(child: Text(info, style: const TextStyle(fontSize: dialogInfoSize)))],
  );
}
