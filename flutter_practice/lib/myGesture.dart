import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class myGesture extends StatefulWidget {
  const myGesture({super.key});

  @override
  State<myGesture> createState() => _myGestureState();
}

class _myGestureState extends State<myGesture> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.all(80.0),
          margin: const EdgeInsets.all(50.0),
          color: selected ? Colors.blue : Colors.red,
          width: selected ? 250.0 : 310.0,
          height: selected ? 250.0 : 310.0,
          duration: Duration(milliseconds: 50),
          child: const Text(
            "This is",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
