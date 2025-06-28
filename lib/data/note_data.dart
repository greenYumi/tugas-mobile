import 'package:flutter/material.dart';

List<Map<String, dynamic>> noteData = [
  {
    'list_id': 0,
    "title": "My Note Today",
    "date": DateTime.now(),
    "icon": Icons.note,
    "notes": [
      {
        "note_id": 0,
        "title": "note's title",
        "date": DateTime.now(),
        "content":
            "this is the note content. this is the note content. this is the note content. this is the note content. this is the note content.",
        "color": Colors.white,
        "icon": Icons.note,
      },
      {
        "note_id": 1,
        "title": "note's title",
        "date": DateTime.now(),
        "content": "this is the note content.",
        "color": Colors.white,
      },
      {
        "note_id": 2,
        "title": "note's title",
        "date": DateTime.now(),
        "content": "this is the note content.",
        "color": Colors.blue,
      },
      {
        "note_id": 3,
        "title": "note's title",
        "date": DateTime.now(),
        "content": "this is the note content.",
        "color": Colors.white,
      },
    ],
  },
];
