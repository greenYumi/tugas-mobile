import 'package:flutter/material.dart';
import 'package:well_being_2/widget/user_option_dialog_box.dart';

class UserOptionResponsesDialogContainer extends StatelessWidget {
  const UserOptionResponsesDialogContainer({
    super.key,
    required this.responses,
  });

  final List<UserOptionDialogBox> responses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [...responses],
    );
  }
}
