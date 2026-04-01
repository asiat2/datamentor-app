import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class ExcelLesson8 extends StatefulWidget {
  const ExcelLesson8({super.key});

  @override
  State<ExcelLesson8> createState() => _ExcelLesson8State();
}

class _ExcelLesson8State extends State<ExcelLesson8> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 8 — Sorting & Filtering") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 8 — Sorting & Filtering", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget exampleBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 8 — Sorting & Filtering"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            sectionTitle("Definition"),

            const Text(
              "Sorting and filtering help organize and analyze datasets in Excel. "
              "Sorting arranges data alphabetically or numerically, while filtering "
              "displays only rows that meet specific conditions.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Example Dataset"),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  "assets/images/excel_sort_filter.png",
                ),
              ),
            ),

            sectionTitle("Sorting Example"),

            exampleBox(
              "Sort Last Name Column A → Z"
            ),

            exampleBox(
              "Excel organizes names alphabetically such as Abbey, Abril, Alkire, Ascencio."
            ),

            sectionTitle("Filtering Example"),

            exampleBox(
              "Filter Date Column"
            ),

            exampleBox(
              "Excel allows selecting specific dates such as 21/05/2015."
            ),

            exampleBox(
              "Only rows with the selected date remain visible."
            ),

            sectionTitle("Why Sorting & Filtering Are Important"),

            const Text(
              "Sorting and filtering are essential for data analysis. "
              "They help analysts clean data, focus on relevant information, "
              "and quickly identify patterns in large datasets.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Real-Life Example"),

            exampleBox(
              "A sales analyst filters data to see only transactions from 2024."
            ),

            exampleBox(
              "A customer service team sorts customers alphabetically "
              "to find a client quickly."
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