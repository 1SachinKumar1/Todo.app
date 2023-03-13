import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'todo_tile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  List toDoList = [
    ["Take Bath", false],
    ["Drink Milk", false],
    ["Prepare Lunch", false],
    ["Electricity bill payment", false],
    ["Hang Out", false],
    ["Coding", false],
    ["Cycling", false],
    ["Play Video games", false]
  ];

  //checkbox onPressed/onChanged
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logOut, icon: const Icon(Icons.logout),color: Colors.black,)
        ],
        centerTitle: true,
        title: const Text(
          "TO DO",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        toolbarHeight: 60,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return Todo(
            taskCompleted: toDoList[index][1],
            taskName: toDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
