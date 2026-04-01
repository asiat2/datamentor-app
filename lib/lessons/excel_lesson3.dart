import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson3 extends StatefulWidget {
  const ExcelLesson3({super.key});
  @override
  State<ExcelLesson3> createState() => _ExcelLesson3State();
}

class _ExcelLesson3State extends State<ExcelLesson3> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 3 — Basic Excel Formulas") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 3 — Basic Excel Formulas", true);

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
      appBar: AppBar(title: const Text("Lesson 3 — Basic Excel Formulas")),

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
              "Excel formulas perform calculations using numbers, "
              "cell references and operators.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Formula",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            box("=A1 + A2"),
            box("=A1 - A2"),
            box("=A1 * A2"),
            box("=A1 / A2"),

            const SizedBox(height: 20),

            const Text(
              "Examples",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            example("=A1 + A2", "Adds two numbers together."),

            example("=B2*C2", "Price × Quantity to calculate revenue."),
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
