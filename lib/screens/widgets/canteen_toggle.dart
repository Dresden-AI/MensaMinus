import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/model/canteen_list.dart';
import 'package:mensa_minus/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

class CanteenToggle extends StatefulWidget {
  final Canteen canteen;

  const CanteenToggle({super.key, required this.canteen});

  @override
  State<CanteenToggle> createState() => _CanteenToggleState();
}

class _CanteenToggleState extends State<CanteenToggle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CanteenList>(
      builder: (context, canteenList, child) {
        return Row(
          children: [
            Checkbox(
                value: canteenList.selectedCanteens.contains(widget.canteen),
                onChanged: (value) async {
                  if (value == true) {
                    canteenList.selectedCanteens.add(widget.canteen);
                  } else {
                    canteenList.selectedCanteens.remove(widget.canteen);
                  }

                  await setSelectedCanteens(canteenList.selectedCanteens);
                  if (value == true) {
                    await canteenList.fetchMeals(widget.canteen);
                  }

                  setState(() {});
                }),
            Text(
              widget.canteen.name,
            ),
          ],
        );
      },
    );
  }
}