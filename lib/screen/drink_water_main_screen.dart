import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class DrinkWaterMainScreen extends StatefulWidget {
  const DrinkWaterMainScreen({super.key});

  @override
  State<DrinkWaterMainScreen> createState() => _DrinkWaterMainScreenState();
}

class _DrinkWaterMainScreenState extends State<DrinkWaterMainScreen> {
  int goal = 3200;
  int today = 0;
  int defaultDrink = 250;
  bool slider = false;
  double waterSlider = 0;
  DateTime lastDrink = DateTime.now();
  DateTime? nextDrink;
  int setInterval = 2;
  int? countDown;

  Timer? _time;

  void closeSlider() {
    if (slider) {
      slider = false;
    }
  }

  void addToday(int addWater) {
    setState(() {
      lastDrink = nextDrink!;

      if (lastDrink
          .add(Duration(hours: setInterval))
          .isBefore(
            DateTime(lastDrink.year, lastDrink.month, lastDrink.day, 23, 59),
          )) {
        nextDrink = lastDrink.add(Duration(hours: setInterval));
      }

      countDown = nextDrink!.difference(lastDrink).inSeconds.toInt();
      today += addWater;
      closeSlider();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nextDrink = lastDrink.add(Duration(hours: 2));
    countDown = nextDrink!.difference(lastDrink).inSeconds.toInt();

    _time = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countDown = countDown! - 1;
      });
    });
  }

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
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Card(
                            color: Colors.white,
                            child: InkWell(
                              onLongPress: () {},
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Menum selanjutnya:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      "Jam ${nextDrink!.hour.toString().padLeft(2, "0")}: ${nextDrink!.minute.toString().padLeft(2, "0")}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                          255,
                                          156,
                                          210,
                                          255,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            color: Colors.blue.shade200,
                            child: SizedBox(
                              height: 100,
                              child: GestureDetector(
                                onTap: null,
                                onLongPress: () {
                                  setState(() {
                                    slider = true;
                                  });
                                },
                                child: PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  onOpened: () {
                                    setState(() {
                                      closeSlider();
                                    });
                                  },
                                  child: Column(
                                    spacing: 0,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.water_drop_outlined,
                                        color: Colors.white,
                                        size: 45,
                                      ),
                                      Text(
                                        "mL",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  itemBuilder: (context) => <PopupMenuEntry>[
                                    PopupMenuItem(
                                      child: Text("500 ml"),
                                      onTap: () {
                                        addToday(500);
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text("750 ml"),
                                      onTap: () {
                                        addToday(750);
                                      },
                                    ),
                                    PopupMenuItem(
                                      child: Text("900 ml"),
                                      onTap: () {
                                        addToday(900);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Card(
                            color: Colors.blue.shade400,

                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  addToday(defaultDrink);
                                });
                              },
                              child: SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    "Drink $defaultDrink",
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          (slider)
              ? Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 10,
                          right: 30,
                          bottom: 10,
                        ),
                        child: Text(
                          "${waterSlider.toInt()} mL",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Slider(
                        divisions: 20,
                        max: 1000,
                        min: 0,

                        thumbColor: Colors.blue,
                        activeColor: Colors.lightBlueAccent,
                        padding: EdgeInsets.only(
                          left: 150,
                          right: 50,
                          top: 10,
                          bottom: 10,
                        ),
                        value: waterSlider,
                        onChanged: (value) {
                          setState(() {
                            waterSlider = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  waterSlider = 1000;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  15,
                                  175,
                                  255,
                                ),
                              ),
                              child: Text(
                                "Max",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    249,
                                    250,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  15,
                                  175,
                                  255,
                                ),
                              ),
                              onPressed: (waterSlider == 0)
                                  ? null
                                  : () {
                                      setState(() {
                                        slider = false;
                                        today += waterSlider.toInt();
                                        waterSlider = 0;
                                      });
                                    },
                              child: Text(
                                "Drink",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    249,
                                    250,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
