import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/ai_assistant_page.dart';
import 'package:mensa_minus/screens/canteen_page.dart';
import 'package:mensa_minus/screens/config_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static final List<Widget> pages = [
    CanteenPage(),
    const AssistantPage(),
    const ConfigPage()
  ];

  int _pageIndex = 0;

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
            label: "AI",
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
