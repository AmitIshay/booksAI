import 'package:flutter/material.dart';

class CreateOwnStory extends StatefulWidget {
  const CreateOwnStory({super.key});
  @override
  State<StatefulWidget> createState() => _CreateOwnStoryState();
}

class _CreateOwnStoryState extends State<CreateOwnStory> {
  List<TextEditingController> controllers = [TextEditingController()];
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTextField() {
    if (controllers.last.text.trim().isNotEmpty) {
      setState(() {
        controllers.add(TextEditingController());
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Empty text"),
        ),
      );
    }
  }

  void deleteTextField(int index) {
    if (controllers.length > 1) {
      setState(() {
        controllers[index].dispose();
        controllers.removeAt(index);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("you can't delete the last text"),
        ),
      );
    }
  }

  void showDeleteWarningDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete"),
          content: const Text("Are you sure?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                deleteTextField(index);
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Story From Scratch"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controllers[index],
                            minLines: 1,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: "Page Number ${index + 1}",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Color.fromARGB(255, 244, 80, 68)),
                          onPressed: () => showDeleteWarningDialog(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: addTextField,
              icon: const Icon(Icons.add),
              label: const Text("Add Page"),
            ),
          ],
        ),
      ),
    );
  }
}
