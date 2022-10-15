import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:secandnoteapp/style/app_style.dart';

class Note_Reader_Screen extends StatefulWidget {
  Note_Reader_Screen(this.doc);
  QueryDocumentSnapshot doc;

  @override
  State<Note_Reader_Screen> createState() => _Note_Reader_ScreenState();
}

class _Note_Reader_ScreenState extends State<Note_Reader_Screen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStayle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStayle.cardColor[color_id],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStayle.mainTitle,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStayle.dateTitle,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStayle.mainTitle,
            )
          ],
        ),
      ),
    );
  }
}
