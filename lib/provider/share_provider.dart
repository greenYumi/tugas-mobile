import 'package:flutter/material.dart';

class ShareProvider with ChangeNotifier {
  String appBarTitle = "Note Today";

  List<Map<String, dynamic>> appBarData = [
    {
      "id": 0,
      "title": "Note Today",
      "info": {"desk": "ini adalah note today"},
    },
  ];
}
