import 'package:flutter/material.dart';

class DrinkWaterMainScreen extends StatefulWidget {
  const DrinkWaterMainScreen({super.key});

  @override
  State<DrinkWaterMainScreen> createState() => _DrinkWaterMainScreenState();
}

class _DrinkWaterMainScreenState extends State<DrinkWaterMainScreen> {
  int goal = 1000;
  int today = 300;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
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

                        // Main Indicator;
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: CircularProgressIndicator(
                                value: today / goal,
                                strokeWidth: 10,
                                color: Colors.blue,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Center(
                            child: Text(
                              "$today / $goal ml",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
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
