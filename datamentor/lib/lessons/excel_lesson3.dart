import 'package:flutter/material.dart';

class ExcelLesson3 extends StatelessWidget {
  const ExcelLesson3({super.key});

  Widget box(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical:6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize:18)),
    );
  }

  Widget example(String formula, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box(formula),
        Text(explanation),
        const SizedBox(height:10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 3 — Basic Excel Formulas"),
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
              "Excel formulas perform calculations using numbers, "
              "cell references and operators.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Formula",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box("=A1 + A2"),
            box("=A1 - A2"),
            box("=A1 * A2"),
            box("=A1 / A2"),

            const SizedBox(height:20),

            const Text(
              "Examples",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            example(
              "=A1 + A2",
              "Adds two numbers together."
            ),

            example(
              "=B2*C2",
              "Price × Quantity to calculate revenue."
            ),

          ],
        ),
      ),
    );
  }
}