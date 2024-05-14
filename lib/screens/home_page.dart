import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/screens/ai_assistant_page.dart';
import 'package:mensa_minus/screens/canteen_page.dart';
import 'package:mensa_minus/screens/config_page.dart';

class HomePage extends StatefulWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;

  const HomePage({super.key, required this.canteens, required this.selectedCanteens});

  @override
  State<StatefulWidget> createState() => HomePageState(canteens: canteens, selectedCanteens: selectedCanteens);
}

class HomePageState extends State<HomePage> {
  static late final List<Widget> pages;
  int _pageIndex = 0;

  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;

  HomePageState({required this.canteens, required this.selectedCanteens}) {
    pages = [
      CanteenPage(canteens: canteens, selectedCanteens: selectedCanteens),
      const AssistantPage(),
      ConfigPage(canteens: canteens, selectedCanteens: selectedCanteens)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rocket_launch_rounded),
              label: "AI"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: "Settings"
          ),
        ],

        onTap: (page) {
          setState(() {
            _pageIndex = page;
          });
        },
      ),

      body: pages[_pageIndex]
    );
  }
}
