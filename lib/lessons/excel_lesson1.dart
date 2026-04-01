import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson1 extends StatefulWidget {
  const ExcelLesson1({super.key});

  @override
  State<ExcelLesson1> createState() => _ExcelLesson1State();
}

class _ExcelLesson1State extends State<ExcelLesson1> {
  bool isCompleted = false;
  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 1 — What is Excel", true);

    setState(() {
      isCompleted = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 1 — What is Excel") ?? false;
    });
  }

  // void markCompleted() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("Lesson 1 — What is Excel", true);

  //   setState(() {
  //     isCompleted = true;
  //   });
  // }

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
            exampleBox("=SUM(B2:B5)", "Adds a range of numbers."),

            exampleBox("=AVERAGE(B2:B5)", "Calculates the average."),

            exampleBox("=COUNT(B2:B5)", "Counts how many numbers exist."),

            const SizedBox(height: 20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox("=SUM(B2:B5)", "A store calculates total sales."),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: isCompleted
                    ? null
                    : () async {
                        await markCompleted();
                        Navigator.pop(context);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(isCompleted ? "Completed ✅" : "Mark as Completed"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
