import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_being_2/data/end_drawer_list.dart';
import 'package:well_being_2/provider/app_provider.dart';
import 'package:well_being_2/widget/app_dialog_box.dart';
import 'package:well_being_2/widget/end_drawer_list.dart';
import 'package:well_being_2/widget/user_option_responses_dialog_container.dart';
import 'package:well_being_2/widget/user_response_box.dart';

class MainDialogScreen extends StatefulWidget {
  const MainDialogScreen({super.key});

  @override
  State<MainDialogScreen> createState() => _MainDialogScreenState();
}

class _MainDialogScreenState extends State<MainDialogScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // tuggu hingga frame selesai kemudian scrool chat.
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => scrollToBottom(),
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal.shade50),
      drawer: Drawer(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ...endDrawerListData.map((e) {
              return EndDrawerList(
                name: e["name"],
                callback: () {
                  // add main dialod stack
                  context.read<AppProvider>().mainDialog.add(
                    UserResponseBox(message: e["respons"]),
                  );

                  // Reload response's container in provider
                  context.read<AppProvider>().responseContainer.clear();
                  context.read<AppProvider>().responseContainer.addAll(
                    e["callback"],
                  );
                  Navigator.pop(context);
                  setState(() {});

                  // debug propose
                  print(context.read<AppProvider>().responseContainer);
                },
              );
            }),
          ],
        ),
      ),

      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [...context.read<AppProvider>().mainDialog],
                ),
              ),
            ),
            Container(
              color: Colors.blue.shade50,
              height: 200,
              width: double.infinity,
              child: UserOptionResponsesDialogContainer(
                responses: [...context.read<AppProvider>().responseContainer],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
