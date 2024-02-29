import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/utils/shared_prefs.dart';

class CanteenToggle extends StatefulWidget {
  final Canteen canteen;
  final List<Canteen> selectedCanteens;

  const CanteenToggle({
    super.key,
    required this.canteen,
    required this.selectedCanteens,
  });

  @override
  State<CanteenToggle> createState() => _CanteenToggleState();
}

class _CanteenToggleState extends State<CanteenToggle> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedCanteens.contains(widget.canteen);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: selected,
          onChanged: (value) {
            if (value == true) {
              widget.selectedCanteens.add(widget.canteen);
            } else {
              widget.selectedCanteens.remove(widget.canteen);
            }

            setSelectedCanteens(widget.selectedCanteens);

            setState(() {
              selected = value!;
            });
          }),
        Text(
          widget.canteen.name,
        ),
      ],
    );
  }
}