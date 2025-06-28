import 'package:flutter/material.dart';
import 'package:well_being_2/screen/note_list_screen.dart';

class NoteBook extends StatelessWidget {
  const NoteBook({super.key, required this.noteBook, required this.callback});

  final Map<String, dynamic> noteBook;
  final Function callback;

  final List<String> monthStr = const [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onLongPress: () {},
        onTap: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteListScreen(notes: noteBook),
            ),
          );

          if (result == true) {
            callback();
          }
        },
        leading: Icon(noteBook["icon"], size: 30),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(noteBook["title"], style: TextStyle(fontSize: 20)),
            Text(
              "${noteBook["date"].day} ${monthStr[noteBook["date"].month]} ${noteBook["date"].year}",
            ),
          ],
        ),
        subtitle: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 0, maxHeight: 60),
          child: SizedBox(
            child: Wrap(
              clipBehavior: Clip.antiAlias,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (noteBook["notes"].length == 0)
                      ? [Text("not note")]
                      : [
                          ...noteBook["notes"].map((note) {
                            return Text(
                              "${note["title"]}: ${note["content"]}",
                              style: TextStyle(color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            );
                          }),
                        ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
