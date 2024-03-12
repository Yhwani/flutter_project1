import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class gridview extends StatefulWidget {
  const gridview({super.key});

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 50,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text("1"),
          color: Colors.blue[100],
        ),
      ],
    );
  }
}
