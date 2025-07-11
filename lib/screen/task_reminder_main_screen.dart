import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:well_being_2/data/task_data.dart';

class TaskReminderScreen extends StatefulWidget {
  const TaskReminderScreen({super.key});

  @override
  State<TaskReminderScreen> createState() => _TaskReminderScreenState();
}

class _TaskReminderScreenState extends State<TaskReminderScreen> {
  final TextEditingController _controllerTask = TextEditingController();
  final TextEditingController _controllerTitle = TextEditingController();
  List<String> addNewTaskTemp = [];
  DateTime? addTaskDate;
  //
  Future<void> _showDateTime(
    context,
    void Function(void Function()) dialogSetState,
  ) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2099),
    );

    final time = (date != null)
        ? await showTimePicker(context: context, initialTime: TimeOfDay.now())
        : null;

    if (date != null) {
      addTaskDate = date;
    }
    if (time != null) {
      final newDate = DateTime(
        date!.year,
        date.month,
        date.day,
        //
        time.hour,
        time.minute,
      );

      dialogSetState(() {
        addTaskDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _controllerTitle.text = "New Tasks";
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              ...taskData.map((e) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e["title"],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            (e["reminder"] == null)
                                ? SizedBox.shrink()
                                : Text(
                                    DateFormat(
                                      "MMM d, HH:mm",
                                    ).format(e["reminder"]),
                                  ),
                          ],
                        ),
                        ...e["tasks"].map((t) {
                          return Row(
                            children: [
                              Checkbox(
                                value: t["done"],
                                onChanged: (value) {
                                  t["done"] = value;
                                  setState(() {});
                                },
                              ),
                              Text(t["name"]),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: TextField(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerTitle,
                      decoration: InputDecoration(
                        hintText: "New Task",
                        border: InputBorder.none,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            _showDateTime(context, setState);
                          },
                          child: Text(
                            (addTaskDate == null)
                                ? "add reminder"
                                : DateFormat(
                                    "MMM d, HH:mm",
                                  ).format(addTaskDate!),
                          ),
                        ),
                        ...addNewTaskTemp.map((e) {
                          return SizedBox(
                            width: double.infinity,
                            child: Card(
                              margin: EdgeInsets.all(1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e),
                              ),
                            ),
                          );
                        }),
                        TextField(
                          controller: _controllerTask,
                          decoration: InputDecoration(
                            hint: Text("new task..."),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_controllerTask.text.isNotEmpty) {
                            addNewTaskTemp.add(_controllerTask.text);
                            _controllerTask.clear();
                            setState(() {});
                          }
                        },
                        child: Text("Add +"),
                      ),
                      (addNewTaskTemp.isNotEmpty)
                          ? TextButton(
                              onPressed: () {
                                taskData.add({
                                  "id": taskData.length - 1,
                                  "title": _controllerTitle.text,
                                  "reminder": addTaskDate,
                                  "tasks": [
                                    ...addNewTaskTemp.map((e) {
                                      return {"done": false, "name": e};
                                    }),
                                  ],
                                });
                                Navigator.pop(context, true);
                              },
                              child: Text("Oke"),
                            )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              );
            },
          );

          if (result == null) {
            addNewTaskTemp.clear();
          } else {
            setState(() {});
            _controllerTitle.clear();
            _controllerTask.clear();
            addNewTaskTemp.clear();
            addTaskDate = null;
          }
        },
      ),
    );
  }
}
