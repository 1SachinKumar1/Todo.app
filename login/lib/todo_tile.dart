import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String taskName;
  Function(bool?)? onChanged;
  final bool taskCompleted;

  Todo(
      {super.key,
      required this.onChanged,
      required this.taskCompleted,
      required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                //Tasks
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 17,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          )),
    );
  }
}
