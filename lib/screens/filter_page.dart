import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<StatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Filter!"),
      ),
    );
  }
}
