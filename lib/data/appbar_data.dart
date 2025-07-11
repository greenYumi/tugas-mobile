import 'package:flutter/material.dart';
import 'package:well_being_2/screen/drink_water_main_screen.dart';
import 'package:well_being_2/screen/note_main_screen.dart';

List<Map<String, dynamic>> appBarData = [
  {
    "id": 0,
    "title": "Note Today",
    "icon": Icons.book,
    "screen": NoteMainScreen(),
    "info": {
      "desk":
          "Catat apa yang terjadi dalam kesehariammu, gunakan itu sebagai bahan refleksi atau sebagai momen momen yang ingin kamu curahkan namun tidak ada seorangpun yang kamu ingin beritahu, bagikan saja ada orang spesial yang kamu dia membacanya.",
    },
  },
  {
    "id": 1,
    "title": "Drink Water",
    "icon": Icons.water_drop_outlined,
    "screen": DrinkWaterMainScreen(),
    "info": {
      "desk":
          "Catat apa yang terjadi dalam kesehariammu, gunakan itu sebagai bahan refleksi atau sebagai momen momen yang ingin kamu curahkan namun tidak ada seorangpun yang kamu ingin beritahu, bagikan saja ada orang spesial yang kamu dia membacanya.",
    },
  },
  {
    "id": 2,
    "title": "Task & Reminder",
    "icon": Icons.timer,
    "screen": NoteMainScreen(),
    "info": {"desk": "Reminder catatan pengingat."},
  },
];
