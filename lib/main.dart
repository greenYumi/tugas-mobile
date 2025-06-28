import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_being_2/provider/share_provider.dart';
import 'package:well_being_2/screen/note_main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ShareProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade50,
          title: Text(context.read<ShareProvider>().appBarTitle),
        ),
        drawer: Drawer(),
        body: NoteMainScreen(),
      ),
    );
  }
}
