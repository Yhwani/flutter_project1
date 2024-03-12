import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class list_view extends StatefulWidget {
  const list_view({super.key});

  @override
  State<list_view> createState() => _list_viewState();
}

class _list_viewState extends State<list_view> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 500.0,
          alignment: Alignment.center,
          child: const Text('RED'),
        ),
      ],
    );
  }
}
