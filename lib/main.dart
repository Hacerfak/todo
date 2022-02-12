import 'package:flutter/material.dart';
import 'package:todo/models/item.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  List<Item> items = [];

  HomePage({Key? key}) : super(key: key) {
    items = [];
    items.add(Item('Item 1', false));
    items.add(Item('Item 2', true));
    items.add(Item('Item 3', false));
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: textController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Clique aqui para adicionar uma tarefa.",
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return Dismissible(
            key: Key(index.toString()),
            child: CheckboxListTile(
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
              title: Text(item.title),
            ),
            onDismissed: (direction) {
              setState(() {
                widget.items.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (textController.text.isEmpty) {
            return;
          }
          setState(() {
            widget.items.add(Item(textController.text, false));
            textController.text = "";
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
