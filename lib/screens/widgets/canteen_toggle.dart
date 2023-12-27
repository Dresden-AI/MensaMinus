import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';

class CanteenToggle extends StatefulWidget {
  final Canteen canteen;
  final List<Canteen>
  const CanteenToggle(selectedCanteens,{
    super.key,
    required this.canteen
  });

  @override
  State<CanteenToggle> createState() => _CanteenToggleState();
}

class _CanteenToggleState extends State<CanteenToggle> {
  List<Canteen> selectedCanteens = [];
  bool selected = widget.selectedCantees.contains(widget.canteen.name);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: selected,
            onChanged: (value) {
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