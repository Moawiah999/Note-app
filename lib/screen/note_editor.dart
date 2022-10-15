import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secandnoteapp/style/app_style.dart';

class Note_Editor_Screen extends StatefulWidget {
  const Note_Editor_Screen({super.key});

  @override
  State<Note_Editor_Screen> createState() => _Note_Editor_ScreenState();
}

class _Note_Editor_ScreenState extends State<Note_Editor_Screen> {
  int color_id = Random().nextInt(AppStayle.cardColor.length);
  String date = DateTime.now.toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStayle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStayle.cardColor[color_id],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add new Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: AppStayle.mainTitle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: AppStayle.dateTitle,
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Note content"),
              style: AppStayle.mainTitle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": titleController.text,
            "creation_date": date,
            "note_content": mainController.text,
            "color_id": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("field  to add new note due to $error"));
        },
        child: Icon(
          Icons.save,
          color: Colors.amber,
        ),
      ),
    );
  }
}
