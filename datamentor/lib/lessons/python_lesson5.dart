import 'package:flutter/material.dart';

class PythonLesson5 extends StatelessWidget {
  const PythonLesson5({super.key});

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
        color: Colors.green.shade50,
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
        title: const Text("Lesson 5 — Functions"),
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
              "Functions are reusable blocks of code that perform a specific task. "
              "They help organize code and avoid repetition.",
            ),

            // BASIC FUNCTION
            sectionTitle("Simple Function"),
            infoBox("A function is defined using 'def' and called by its name."),
            codeBox(
              "def greet():\n"
              "    print('Hello')\n\n"
              "greet()",
              "The function 'greet' prints 'Hello'.\n"
              "When we call greet(), the code inside runs.",
            ),

            // FUNCTION WITH PARAMETERS
            sectionTitle("Function with Parameters"),
            infoBox("Parameters allow you to pass values into a function."),
            codeBox(
              "def greet(name):\n"
              "    print('Hello ' + name)\n\n"
              "greet('John')",
              "The function takes a parameter 'name'.\n"
              "When called with 'John', it prints Hello John.",
            ),

            // FUNCTION WITH RETURN
            sectionTitle("Function with Return"),
            infoBox("Return sends a result back from the function."),
            codeBox(
              "def add(a, b):\n"
              "    return a + b\n\n"
              "print(add(5, 3))",
              "The function adds two numbers and returns the result.\n"
              "5 + 3 = 8, so it prints 8.",
            ),

            // DEFAULT PARAMETERS
            sectionTitle("Default Parameters"),
            infoBox("You can give parameters default values."),
            codeBox(
              "def greet(name='Guest'):\n"
              "    print('Hello ' + name)\n\n"
              "greet()\n"
              "greet('Alice')",
              "If no value is passed, it uses 'Guest'.\n"
              "Otherwise, it uses the provided name.",
            ),

            // MULTIPLE RETURNS
            sectionTitle("Multiple Returns"),
            infoBox("A function can return multiple values."),
            codeBox(
              "def calculate(a, b):\n"
              "    return a + b, a * b\n\n"
              "sum, product = calculate(4, 2)\n"
              "print(sum)\n"
              "print(product)",
              "The function returns two values: sum and product.\n"
              "4+2=6 and 4*2=8.",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "Functions help reuse code\n"
              "Parameters pass data into functions\n"
              "Return gives output from functions\n"
              "They make code clean and organized",
            ),

          ],
        ),
      ),
    );
  }
}