import 'package:flutter/material.dart';
import 'package:flutter_practice/gridview.dart';
import 'package:flutter_practice/list_view.dart';
import 'package:flutter_practice/myGesture.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main(List<String> arguments) async {
  //runApp(const MyApp());
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: myGesture()),
    );
  }
}

  // Widget getPage() {
  //   late Widget page;
  //   switch (_curIndex) {
  //     case 0:
  //       page = gridview();
  //       break;
  //     case 1:
  //       page = list_view();
  //       break;
  //     case 2:
  //       page = gridview();
  //       break;
  //   }
  //   return page;
  // }
