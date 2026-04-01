import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson2 extends StatefulWidget {
  const ExcelLesson2({super.key});

  @override
  State<ExcelLesson2> createState() => _ExcelLesson2State();
}

class _ExcelLesson2State extends State<ExcelLesson2> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 2 — Excel Interface") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 2 — Excel Interface", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(description),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 2 — Excel Interface")),

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
              "The Excel interface contains the tools used to work with spreadsheets.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Excel Interface",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset("assets/images/excel_interface.png"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Main Parts",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            section(
              "Ribbon",
              "Contains Excel tools such as charts, formulas, formatting and data analysis.",
            ),

            section(
              "Formula Bar",
              "Displays the contents of the selected cell and allows you to edit formulas.",
            ),

            section(
              "Worksheet Grid",
              "The main area where data is entered using rows and columns.",
            ),

            section(
              "Sheet Tabs",
              "Allows switching between multiple worksheets in one Excel file.",
            ),

            const SizedBox(height: 30),

            // ✅ BUTTON (NOW WORKS)
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
