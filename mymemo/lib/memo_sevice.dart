import 'dart:convert';

import 'package:flutter/material.dart';

import 'main.dart';

class Memo {
  Memo({required this.content, this.isPin = false, required this.time});

  String content;
  bool isPin;
  DateTime? time;

  Map toJson() {
    return {
      'content': content,
      'isPin': isPin,
      'time': time?.toIso8601String(),
    };
  }

  factory Memo.fromJson(json) {
    return Memo(
        content: json['content'],
        isPin: json['isPin'],
        time: json['time'] == null ? null : DateTime.parse(json['time']));
  }
}

// Memo 데이터는 모두 여기서 관리
class MemoService extends ChangeNotifier {
  MemoService() {
    loadMemoList();
  }

  List<Memo> memoList = [];

  createMemo({required String content}) {
    Memo memo = Memo(content: content, time: DateTime.now());
    memoList.add(memo);
    notifyListeners(); // Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
    saveMemoList();
  }

  updateMemo({required int index, required String content}) {
    Memo memo = memoList[index];
    memo.content = content;
    memo.time = DateTime.now();
    notifyListeners();
    saveMemoList();
  }

  deleteMemo({required int index}) {
    memoList.removeAt(index);
    notifyListeners();
    saveMemoList();
  }

  saveMemoList() {
    List memoJsonList = memoList.map((memo) => memo.toJson()).toList();
    // [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memoJsonList);
    // '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memoList', jsonString);
  }

  loadMemoList() {
    String? jsonString = prefs.getString('memoList');
    // '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memoJsonList = jsonDecode(jsonString);
    // [{"content": "1"}, {"content": "2"}]

    memoList = memoJsonList.map((json) => Memo.fromJson(json)).toList();
  }

  pincheck({required int index}) {
    memoList[index].isPin = !memoList[index].isPin;
    memoList = [
      ...memoList.where((element) => element.isPin),
      ...memoList.where((element) => !element.isPin),
    ];
    notifyListeners();
    saveMemoList();
  }

  nullData({required String content, required int index}) {
    if (content.isEmpty) {
      deleteMemo(index: index);
    }
  }
}
