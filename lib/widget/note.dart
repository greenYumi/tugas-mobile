import 'package:flutter/material.dart';
import 'package:well_being_2/data/icon_pack.dart';

class Note extends StatelessWidget {
  const Note({
    super.key,
    required this.listId,
    required this.note,
    required this.callback,
  });

  final int listId;
  final Map<String, dynamic> note;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        ),
        onTap: () {},
        tileColor: note["color"],
        title: Text(note["title"], style: TextStyle(fontSize: 22)),
        subtitle: SizedBox(
          height: 20,
          width: 20,
          child: Text(note["content"], overflow: TextOverflow.ellipsis),
        ),
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                width: double.infinity,
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Change Icon",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                ...popularNoteIcons.map((e) {
                                  return IconButton(
                                    onPressed: () {
                                      note["icon"] = e;
                                      Navigator.pop(context);
                                      callback();
                                    },
                                    icon: Icon(e),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: Icon(note["icon"] ?? Icons.note),
        ),
        trailing: PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.delete),
                title: Text("Hapus"),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              child: ListTile(
                onTap: () {
                  note["color"] = Colors.red.shade300;
                  Navigator.pop(context);
                  callback();
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade300,
                  radius: 16,
                ),
                title: Text("Red"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
