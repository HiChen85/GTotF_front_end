import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_theory_matching_game/data/scenarios_data.dart';
import 'package:graph_theory_matching_game/pages/home_page/home_page_item.dart';
import 'package:graph_theory_matching_game/routes/routes.dart';
import 'package:graph_theory_matching_game/style/style.dart';

class SceneView extends StatefulWidget {
  const SceneView({
    Key? key,
  }) : super(key: key);

  @override
  State<SceneView> createState() => _SceneViewState();
}

class _SceneViewState extends State<SceneView> {
  PageController? _controller;
  int initialPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(viewportFraction: 0.75, initialPage: initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pageViewWidth,
      height: pageViewHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: defaultGradient,
      ),
      child: PageView(
        controller: _controller,
        children: _buildPageItem(pageViewItemWidth, pageViewItemHeight),
      ),
    );
  }

  List<Widget> _buildPageItem(double width, double height) {
    return List.generate(
      scenarios.keys.length,
      (index) => GestureDetector(
        child: PageItem(width: width, height: height, index: index),
        // make a http request when tap
        onTap: () async {
          Dio dio = Dio();
          var response = await dio.get("http://localhost:8000/getMaximum", queryParameters: {'scenario': "scenario${index + 1}"});
          print(response.data);
          Get.toNamed(AppRoutes.homePage + AppRoutes.basePageUrl + '$index', arguments: {"maximum": response.data});
        },
      ),
    );
  }
}
