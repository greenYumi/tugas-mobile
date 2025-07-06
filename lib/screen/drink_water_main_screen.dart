import 'package:flutter/material.dart';

class DrinkWaterMainScreen extends StatefulWidget {
  const DrinkWaterMainScreen({super.key});

  @override
  State<DrinkWaterMainScreen> createState() => _DrinkWaterMainScreenState();
}

class _DrinkWaterMainScreenState extends State<DrinkWaterMainScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Card(
                          color: Colors.blue.shade50,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  value: 100,
                                  strokeWidth: 7,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shadowColor: Colors.transparent,
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: CircularProgressIndicator(
                                  value: 50 / 100,
                                  strokeWidth: 7,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(width: 200, height: 100),
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      child: Text("drink"),
                      itemBuilder: (context) {
                        return <PopupMenuEntry>[
                          PopupMenuItem(child: Text("500 ml"), onTap: () {}),
                          PopupMenuItem(child: Text("1000 ml")),
                          PopupMenuItem(child: Text("1500 ml")),
                          PopupMenuItem(child: Text("2000 ml")),
                        ];
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
