import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (() {}), icon: Icon(Icons.person))],
          backgroundColor: Colors.black,
          centerTitle: false,
          title: Text(
            "AI BaseBall",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://cdn.icon-icons.com/icons2/630/PNG/512/baseball-set_icon-icons.com_57935.png",
                    width: 81,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "아이디",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "비밀번호",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        )),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      print('로그인 버튼 클릭');
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
