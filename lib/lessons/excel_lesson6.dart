import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson6 extends StatefulWidget {
  const ExcelLesson6({super.key});

  @override
  State<ExcelLesson6> createState() => _ExcelLesson6State();
}

class _ExcelLesson6State extends State<ExcelLesson6> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 6 — VLOOKUP & XLOOKUP") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 6 — VLOOKUP & XLOOKUP", true);

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
      appBar: AppBar(title: const Text("Lesson 6 — VLOOKUP & XLOOKUP")),

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
              "Lookup functions search for information in tables.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Formula",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            box("=VLOOKUP(lookup_value, table_array, column_index, FALSE)"),
            box("=XLOOKUP(lookup_value, lookup_array, return_array)"),

            const SizedBox(height: 20),

            const Text(
              "Examples",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            example(
              "=VLOOKUP(A2,A1:C10,2,FALSE)",
              "Finds employee salary based on employee ID.",
            ),

            example(
              "=XLOOKUP(A2,A1:A10,B1:B10)",
              "Finds product price based on product name.",
            ),

            example(
              "=VLOOKUP(A2,A1:D20,4,FALSE)",
              "Finds student grade from a grade table.",
            ),
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
