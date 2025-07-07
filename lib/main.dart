import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:well_being_2/data/appbar_data.dart';
import 'package:well_being_2/provider/share_provider.dart';
import 'package:well_being_2/screen/drink_water_main_screen.dart';
import 'package:well_being_2/screen/note_main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ShareProvider())],
      child: MyApp(),
    ), //
  );
}

int currenIndexScreen = 1;
final List<Map<String, dynamic>> screenData = appBarData;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade50,
          title: Text(screenData[currenIndexScreen]["title"]),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.white,
                      ),

                      height: 500,
                      width: double.infinity,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              screenData[currenIndexScreen]["title"],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              screenData[currenIndexScreen]["info"]["desk"],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.info),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CircleAvatar(radius: 30),
                      Text("Profile", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              ...screenData.map((e) {
                return Builder(
                  builder: (context) {
                    return ListTile(
                      title: Text(e["title"]),
                      onTap: () {
                        currenIndexScreen = e["id"];
                        setState(() {});
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
        body: [NoteMainScreen(), DrinkWaterMainScreen()][currenIndexScreen],
      ),
    );
  }
}
