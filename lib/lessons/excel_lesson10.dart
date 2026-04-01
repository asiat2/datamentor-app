import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson10 extends StatefulWidget {
  const ExcelLesson10({super.key});

  @override
  State<ExcelLesson10> createState() => _ExcelLesson10State();
}

class _ExcelLesson10State extends State<ExcelLesson10> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 10 — Excel Charts") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 10 — Excel Charts", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 10 — Excel Charts")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section(
              "Definition",
              "Charts visually represent data to help identify trends, comparisons, and patterns.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Example Chart",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset("assets/images/excel_chart.png"),
              ),
            ),

            const SizedBox(height: 20),

            section(
              "Dataset",
              "The pivot table summarizes values by Country and Gender.",
            ),

            section(
              "Chart Type",
              "This is a clustered column chart used to compare values across categories.",
            ),

            section(
              "Insight",
              "The United States shows the highest values and female counts are higher than male counts.",
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
