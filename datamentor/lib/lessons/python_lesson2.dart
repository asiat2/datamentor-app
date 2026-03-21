import 'package:flutter/material.dart';

class PythonLesson2 extends StatelessWidget {
  const PythonLesson2({super.key});

  Widget codeBox(String code, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical:8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(code),
        ),

        Text(explanation),

        const SizedBox(height:12),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 2 — Python Variables & Data Types"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Definition",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            const Text(
              "Variables are used to store values in Python programs. "
              "Python supports different data types such as integers, "
              "floats, strings, and booleans.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Common Data Types",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const Text(
              "int → whole numbers\n"
              "float → decimal numbers\n"
              "str → text values\n"
              "bool → True or False",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Example 1 — Creating Variables",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "name = 'John'\n"
              "age = 30\n"
              "salary = 4500.75",
              "This code creates three variables storing different types of values."
            ),

            const SizedBox(height:20),

            const Text(
              "Example 2 — Checking Data Type",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "age = 30\n"
              "print(type(age))",
              "The type() function returns the data type of a variable."
            ),

            const SizedBox(height:20),

            const Text(
              "Example 3 — Boolean Values",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "is_active = True\n"
              "print(is_active)",
              "Boolean variables store True or False values."
            ),

          ],
        ),
      ),
    );
  }
}