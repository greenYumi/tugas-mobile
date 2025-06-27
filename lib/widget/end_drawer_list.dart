import 'package:flutter/material.dart';

class EndDrawerList extends StatelessWidget {
  const EndDrawerList({super.key, required this.name, required this.callback});

  final String name;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          callback();
        },
        title: Text(name),
      ),
    );
  }
}
