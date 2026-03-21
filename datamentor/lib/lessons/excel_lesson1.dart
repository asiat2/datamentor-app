import 'package:flutter/material.dart';

class ExcelLesson1 extends StatelessWidget {
  const ExcelLesson1({super.key});

  Widget exampleBox(String formula, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(formula, style: const TextStyle(fontSize: 18)),
        ),

        Text(explanation),

        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 1 — What is Excel")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Microsoft Excel is a spreadsheet tool used to store, organize, "
              "and analyze data using rows and columns.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Simple Example",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox("=10+5", "Excel calculates 15."),
            exampleBox(
              "=SUM(B2:B5)",
              "Adds a range of numbers (e.g., total sales or total patients).",
            ),

            exampleBox(
              "=AVERAGE(B2:B5)",
              "Calculates the average (e.g., average patient cost).",
            ),

            exampleBox(
              "=COUNT(B2:B5)",
              "Counts how many numbers exist (e.g., number of visits).",
            ),
            const SizedBox(height: 20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox(
              "=SUM(B2:B5)",
              "A store calculates total sales for the week.",
            ),
          ],
        ),
      ),
    );
  }
}
