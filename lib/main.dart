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
  MyApp({super.key});
  final PageController _myPageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade50,
          title: Text(context.read<ShareProvider>().appBarTitle),
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
                              "NOTE TODAY",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
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
        drawer: Drawer(),
        body: NoteMainScreen(),
      ),
    );
  }
}
