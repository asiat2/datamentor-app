import 'package:flutter/material.dart';

class PythonLesson3 extends StatelessWidget {
  const PythonLesson3({super.key});

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
        color: Colors.blue.shade50,
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
        title: const Text("Lesson 3 — Lists, Tuples, Dictionaries"),
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
              "Python provides powerful data structures such as Lists, Tuples, "
              "and Dictionaries to store and manage collections of data.",
            ),

            // LISTS
            sectionTitle("Lists"),
            infoBox(
              "Lists are ordered, changeable collections that allow duplicate values.",
            ),
            codeBox(
              "numbers = [10, 20, 30]\nprint(numbers[1])",
              "Lists use index positions starting from 0.\n"
              "numbers[1] returns 20 because it is the second item.",
            ),

            // TUPLES
            sectionTitle("Tuples"),
            infoBox(
              "Tuples are ordered collections that cannot be changed (immutable).",
            ),
            codeBox(
              "coordinates = (10, 20)\nprint(coordinates)",
              "Tuples are used for fixed data like coordinates.\n"
              "You cannot modify values after creation.",
            ),

            // DICTIONARIES
            sectionTitle("Dictionaries"),
            infoBox(
              "Dictionaries store data as key-value pairs.",
            ),
            codeBox(
              "student = {\n"
              "  'name': 'John',\n"
              "  'age': 22\n"
              "}\n"
              "print(student['name'])",
              "Dictionaries use keys to access values.\n"
              "student['name'] returns 'John'.",
            ),

            const SizedBox(height: 20),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "List → Ordered & changeable\n"
              "Tuple → Ordered & fixed\n"
              "Dictionary → Key-value pairs",
            ),
          ],
        ),
      ),
    );
  }
}