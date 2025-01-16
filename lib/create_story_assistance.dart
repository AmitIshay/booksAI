import 'package:flutter/material.dart';

class BookQuestionsScreen extends StatefulWidget {
  const BookQuestionsScreen({super.key});

  @override
  State<BookQuestionsScreen> createState() => _BookQuestionsScreenState();
}

class _BookQuestionsScreenState extends State<BookQuestionsScreen> {
  // Questions grouped by category
  final Map<String, List<String>> questions = {
    "Basic Questions": [
      "What is the genre of the book you want to write?",
      "What is the name of your book (if you have an idea)?"
    ],
    "Plot Questions": [
      "What is the main idea or theme of your book?",
      "What is the starting point of the plot?",
      "What is the central conflict in the story?",
      "How do you envision the ending?"
    ],
    "Character Questions": [
      "Who is your main character?",
      "What is the goal of your main character?",
      "Are there secondary characters?",
      "Is there an antagonist in your story?"
    ],
    "World and Atmosphere Questions": [
      "Where does your story take place?",
      "What kind of atmosphere would you like to create in your book?",
      "Are there any special rules in your story's world?"
    ],
    "Message and Audience Questions": [
      "What message would you like to convey to your readers?",
      "Who is the target audience for your book?"
    ],
    "Additional Inspiration Questions": [
      "What is your inspiration for writing this book?",
      "If your book became a movie, who would you want to direct it?",
      "What is the title of the first chapter?",
      "What is a central scene you imagine in your head?",
      "If you could write only one sentence about your book, what would it be?"
    ]
  };

  final Map<String, String> userAnswers = {}; // Store user answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions About Your Book"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.keys.length,
              itemBuilder: (context, categoryIndex) {
                String category = questions.keys.elementAt(categoryIndex);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ExpansionTile(
                    title: Text(
                      category,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: questions[category]!.map((question) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Write your answer here...",
                              ),
                              maxLines: null,
                              onChanged: (value) {
                                setState(() {
                                  userAnswers[question] = value;
                                });
                              },
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Action to create the story
                print("User answers: $userAnswers");
              },
              child: const Text("Create Story"),
            ),
          ),
        ],
      ),
    );
  }
}
