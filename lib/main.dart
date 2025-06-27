import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_being_2/provider/app_provider.dart';
import 'package:well_being_2/screen/main_dialog_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: MainScreen(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainDialogScreen(),
    );
  }
}
