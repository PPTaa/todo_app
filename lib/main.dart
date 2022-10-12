import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child:TableView()),
            Container(
              height: 30,
              child: Row(
                children: [
                  Expanded(child:
                    TextField(
                      decoration:  InputDecoration(
                          labelText: "aaaa"
                      ),
                    )
                  ),
                  CupertinoButton(
                    padding:  EdgeInsets.fromLTRB(12, 0, 12, 0),
                    color: Colors.blue,
                    onPressed: () {},
                    child: const Text("button"),
                  ),
                  CupertinoButton(
                    padding:  EdgeInsets.zero,
                    color: Colors.blue,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.plus)
                  ),
                ],
              ),
            )
          ],
        ),

        // TableView(),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.terminal_outlined),
                    Text("write")
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings),
                    Text("settings")
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

class TodoContent extends StatefulWidget {
  const TodoContent({Key? key, required this.content}) : super(key: key);

  final String content;
  @override
  State<TodoContent> createState() => _TodoContentState();
}

class _TodoContentState extends State<TodoContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TodoCheckBox(),
        Text(widget.content)
        
      ],
    );
  }
}


class TodoCheckBox extends StatefulWidget {
  const TodoCheckBox({Key? key}) : super(key: key);

  @override
  State<TodoCheckBox> createState() => _TodoCheckBoxState();
}

class _TodoCheckBoxState extends State<TodoCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState> {
        MaterialState.pressed,
        MaterialState.focused,
        MaterialState.hovered,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Checkbox(
        shape: CircleBorder(side: BorderSide.none),
        checkColor: Colors.yellow ,
        fillColor: MaterialStateColor.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        }
    );
  }
}

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);
  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Today", style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold
        )),
        Column(
          children: _getListData(10),
        ),
        Text("Upcoming", style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold
        )),
        Column(
          children: _getListData(8),
        ),
      ]
    );
  }
  _getListData(int count) {
    List<Widget> widgets = [];
    for (int i = 0; i < count; i++) {
      widgets.add(Padding(padding: EdgeInsets.all(10), child: TodoContent(content: "content No.$i",)));
    }
    return widgets;
  }
}

