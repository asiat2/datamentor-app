import 'package:flutter/material.dart';

class PythonLesson4 extends StatelessWidget {
  const PythonLesson4({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget explanationText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget codeBox(String code, String explanation) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            explanation,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 4 — Control Flow"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // INTRO
            sectionTitle("Definition"),
            explanationText(
              "Control flow allows a program to make decisions and repeat actions "
              "using conditions and loops.",
            ),

            // IF STATEMENT
            sectionTitle("IF Statement"),
            infoBox(
              "The if statement checks a condition. If it is true, the code runs.",
            ),
            codeBox(
              "age = 20\n"
              "if age >= 18:\n"
              "    print('Adult')",
              "The condition checks if age is greater than or equal to 18.\n"
              "Since it is true, 'Adult' is printed.",
            ),

            // FOR LOOP
            sectionTitle("FOR Loop"),
            infoBox(
              "The for loop repeats code a specific number of times.",
            ),
            codeBox(
              "for i in range(5):\n"
              "    print(i)",
              "range(5) generates numbers from 0 to 4.\n"
              "The loop prints each number one by one.",
            ),

            // WHILE LOOP
            sectionTitle("WHILE Loop"),
            infoBox(
              "The while loop repeats as long as a condition is true.",
            ),
            codeBox(
              "count = 0\n"
              "while count < 3:\n"
              "    print(count)\n"
              "    count += 1",
              "The loop runs while count is less than 3.\n"
              "Each time, count increases by 1 until the condition becomes false.",
            ),

            const SizedBox(height: 20),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "IF → Makes decisions\n"
              "FOR → Repeats a fixed number of times\n"
              "WHILE → Repeats based on a condition",
            ),
          ],
        ),
      ),
    );
  }
}