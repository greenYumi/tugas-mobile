import 'package:well_being_2/widget/user_option_dialog_box.dart';

List<Map<String, dynamic>> endDrawerListData = [
  {
    "name": "Focus Mode",
    "callback": [
      UserOptionDialogBox(response: "Ok, Ayo mulai"),
      UserOptionDialogBox(response: "Tunggu sebentar"),
    ],
    "respons": "Mode focus",
  },
];
