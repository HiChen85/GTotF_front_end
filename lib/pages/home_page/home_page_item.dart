import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final double width;
  final double height;
  final int index;

  const PageItem({Key? key, required this.width, required this.height, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Scenario   ${index + 1}",
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent, fontSize: 22),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/images/cover_${index + 1}.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
