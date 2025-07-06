import 'package:flutter/material.dart';

class DrinkWaterMainScreen extends StatefulWidget {
  const DrinkWaterMainScreen({super.key});

  @override
  State<DrinkWaterMainScreen> createState() => _DrinkWaterMainScreenState();
}

class _DrinkWaterMainScreenState extends State<DrinkWaterMainScreen> {
  int goal = 3200;
  int today = 300;
  int defaultDrink = 250;

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
                              child: TweenAnimationBuilder(
                                tween: Tween(begin: 0, end: today / goal),
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                builder: (context, value, child) =>
                                    CircularProgressIndicator(
                                      value: value / 1,
                                      strokeWidth: 10,
                                      color: (today < goal)
                                          ? Colors.cyan.shade600
                                          : Colors.lightBlue,
                                      strokeCap: StrokeCap.round,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$today / $goal ml",
                                  style: (today < goal)
                                      ? TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        )
                                      : TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                ),
                                (today >= goal)
                                    ? Text("Kamu minum cukup air hari ini")
                                    : SizedBox.shrink(),
                              ],
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
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      today += defaultDrink;
                    });
                  },
                  onLongPress: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Drink 250ml", style: TextStyle(fontSize: 20)),
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
