import 'package:flutter/material.dart';

class PythonLesson1 extends StatelessWidget {
  const PythonLesson1({super.key});

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
        title: const Text("Lesson 1 — Introduction to Python"),
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

            const SizedBox(height:10),

            const Text(
              "Python is a high-level programming language widely used "
              "for data analysis, machine learning, automation, and "
              "software development. Python is popular because its "
              "syntax is simple and easy to read.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Why Python is Important for Data Analysis",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const Text(
              "Python allows analysts to work with large datasets, "
              "perform calculations, clean messy data, and create "
              "visualizations. Libraries such as Pandas, NumPy, and "
              "Matplotlib make data analysis easier.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Example 1 — Printing Text",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "print('Hello World')",
              "The print() function displays text on the screen."
            ),

            const SizedBox(height:20),

            const Text(
              "Example 2 — Simple Calculation",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "x = 10\n"
              "y = 5\n"
              "print(x + y)",
              "This program adds two numbers and prints the result."
            ),

            const SizedBox(height:20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            codeBox(
              "price = 20\n"
              "quantity = 4\n"
              "total = price * quantity\n"
              "print(total)",
              "A data analyst could calculate total sales revenue."
            ),

          ],
        ),
      ),
    );
  }
}