import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mensa_minus/model/canteen_list.dart';
import 'package:mensa_minus/screens/filter_page.dart';
import 'package:mensa_minus/screens/widgets/canteen_tile.dart';
import 'package:provider/provider.dart';

class CanteenPage extends StatefulWidget {
  const CanteenPage({super.key});

  @override
  State<CanteenPage> createState() => _CanteenPageState();
}

class _CanteenPageState extends State<CanteenPage> {
  bool _showFloatingActionButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),

      floatingActionButton: AnimatedScale(
        scale: _showFloatingActionButton ? 1.0 : 0.001,
        duration: const Duration(milliseconds: 300),
        child: AnimatedOpacity(
          opacity: _showFloatingActionButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: OpenContainer(
            openBuilder: (BuildContext context, VoidCallback _) => const FilterPage(),
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
                    size: 40,
                    Icons.filter_alt_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      body: Consumer<CanteenList>(builder: (context, canteenList, child) {
        return RefreshIndicator(
          onRefresh: () async {
            return canteenList.refreshAllMeals();
          },
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.reverse) {
                if (_showFloatingActionButton) {
                  setState(() => _showFloatingActionButton = false);
                }
              } else if (notification.direction == ScrollDirection.forward) {
                if (!_showFloatingActionButton) {
                  setState(() => _showFloatingActionButton = true);
                }
              }

              return true;
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: canteenList.selectedCanteens.length,
              itemBuilder: (BuildContext context, int index) {
                return CanteenMeal(canteen: canteenList.selectedCanteens[index]);
              },
            ),
          ),
        );
      }),
    );
  }
}
