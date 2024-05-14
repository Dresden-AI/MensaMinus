import 'package:flutter/cupertino.dart';

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<StatefulWidget> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Einfach mit AI mensen gehen!"),
    );
  }
}