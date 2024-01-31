import 'package:flutter/material.dart';
import 'package:mensa_minus/model/canteen.dart';
import 'package:mensa_minus/screens/config_page.dart';

class HomePage extends StatefulWidget {
  final List<Canteen> canteens;
  final List<Canteen> selectedCanteens;
  const HomePage({super.key, required this.canteens, required this.selectedCanteens});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mensa Minus'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigPage(canteens: widget.canteens, selectedCanteens: widget.selectedCanteens))),
            icon: const Icon(Icons.settings))
        ],
      ),
      body: const Center(
        child: Text(
          'Lieber mensen gehen!',
        ),
      ),
    );
  }
}