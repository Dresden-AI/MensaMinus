import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/utils/datatypes.dart';
import 'package:mensa_minus/utils/shared_prefs.dart';

class CanteenToggle extends StatefulWidget {
  final Canteen canteen;
  final SelectedCanteens selectedCanteens;
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
    selected = widget.selectedCanteens.list.contains(widget.canteen);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: selected,
          onChanged: (value) {
            if (value == true) {
              widget.selectedCanteens.list.add(widget.canteen);
            } else {
              widget.selectedCanteens.list.remove(widget.canteen);
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