import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mensa_minus/screens/ai_assistant_page.dart';
import 'package:mensa_minus/screens/canteen_page.dart';
import 'package:mensa_minus/screens/config_page.dart';
import 'package:mensa_minus/screens/filter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static final List<Widget> pages = [
    const CanteenPage(),
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

      floatingActionButton: _pageIndex == 0 ? OpenContainer(
        openBuilder: (BuildContext context, VoidCallback _) => const FilterPage(),
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(65.0 / 3),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 65.0,
            width: 65.0,
            child: Center(
              child: Icon(
                Icons.filter_alt_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ) : null,

      body: pages[_pageIndex]
    );
  }
}
