import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Book {
  String id;
  String title;
  List authors;
  String publishedDate;
  String thumbnail; // 썸네일 이미지 링크
  String previewLink; // ListTile 을 눌렀을 때 이동하는 링크

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.thumbnail,
    required this.previewLink,
  });

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      "publishedDate": publishedDate,
      "thumbnail": thumbnail,
      "previewLink": previewLink
    };
  }

  factory Book.fromJson(json) {
    return Book(
      id: json['id'],
      title: json['title'],
      authors: json["authors"],
      publishedDate: json["publishedDate"],
      thumbnail: json["thumbnail"],
      previewLink: json["previewLink"],
    );
  }
}
