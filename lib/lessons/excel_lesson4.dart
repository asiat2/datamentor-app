import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson4 extends StatefulWidget {
  const ExcelLesson4({super.key});

  @override
  State<ExcelLesson4> createState() => _ExcelLesson4State();
}

class _ExcelLesson4State extends State<ExcelLesson4> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 4 — SUM, AVERAGE, COUNT") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 4 — SUM, AVERAGE, COUNT", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget box(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }

  Widget example(String formula, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [box(formula), Text(explanation), const SizedBox(height: 10)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 4 — SUM, AVERAGE, COUNT")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Excel includes built-in functions to summarize data.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Formula",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            box("=SUM(A1:A10)"),
            box("=AVERAGE(A1:A10)"),
            box("=COUNT(A1:A10)"),

            const SizedBox(height: 20),

            const Text(
              "Examples",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            example("=SUM(B2:B7)", "Adds weekly sales for a store."),

            example("=AVERAGE(C2:C10)", "Calculates average exam score."),

            example("=COUNT(A1:A30)", "Counts number of employees in a list."),
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
