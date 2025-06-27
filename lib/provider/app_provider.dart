import 'package:flutter/material.dart';
import 'package:well_being_2/widget/app_dialog_box.dart';
import 'package:well_being_2/widget/user_option_dialog_box.dart';

class AppProvider with ChangeNotifier {
  List<UserOptionDialogBox> responseContainer = [];
  List<Widget> mainDialog = [AppDialogBox(message: "Hai Selamat pagi, \$user")];
}
