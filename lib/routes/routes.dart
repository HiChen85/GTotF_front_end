import 'package:get/get.dart';
import 'package:graph_theory_matching_game/data/scenarios_data.dart';
import 'package:graph_theory_matching_game/pages/home_page/home_page.dart';
import 'package:graph_theory_matching_game/pages/scenario_page/scenario_page.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const basePageUrl = '/page/';
  static const page = basePageUrl + ':id';
}

class RoutePages {
  static final pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      children: _buildPages(scenarios.length),
    ),
  ];

  static List<GetPage> _buildPages(int length) {
    return List.generate(
      length,
      (index) => GetPage(
        name: AppRoutes.page,
        page: () {
          return SceneDetail();
        },
      ),
    );
  }
}
