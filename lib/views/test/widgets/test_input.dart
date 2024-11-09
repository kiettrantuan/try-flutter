import 'package:flutter/material.dart';

class InputExample extends StatefulWidget {
  const InputExample({super.key});

  @override
  State<InputExample> createState() => _InputExampleState();
}

class _InputExampleState extends State<InputExample> {
  // Create a controller to manage the text field's state
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        // Only include the TextField for a specific index for demonstration purposes
        if (index == 10) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController, // Attach the controller here
              decoration: const InputDecoration(
                labelText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
          );
        }
        // Other items in the list
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
