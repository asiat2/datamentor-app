import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson11 extends StatefulWidget {
  const TableauLesson11({super.key});

  @override
  State<TableauLesson11> createState() => _TableauLesson11State();
}

class _TableauLesson11State extends State<TableauLesson11> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 11 — Storytelling with Data") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 11 — Storytelling with Data", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget exampleBox(String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 11 — Storytelling with Data"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DEFINITION
            sectionTitle("Definition"),
            explanation(
              "Storytelling with data is the process of using data, visuals, "
              "and explanations to communicate insights and support decisions.",
            ),

            infoBox(
              "Good storytelling answers: What happened? Why did it happen? What should we do next?",
            ),

            // STRUCTURE
            sectionTitle("Structure of a Data Story"),

            infoBox(
              "1. Introduction → What is the problem?\n"
              "2. Data → What does the data show?\n"
              "3. Insight → What does it mean?\n"
              "4. Action → What should be done?",
            ),

            // BUSINESS EXAMPLE
            sectionTitle("Business Example"),

            exampleBox(
              "Sales Story",
              "Step 1: Sales decreased last quarter\n"
                  "Step 2: Line chart shows decline\n"
                  "Step 3: Analysis shows drop in one region\n"
                  "Step 4: Recommend focusing marketing in that region",
            ),

            // HEALTHCARE EXAMPLE
            sectionTitle("Healthcare Example"),

            exampleBox(
              "Patient Analysis Story",
              "Step 1: Increase in patient admissions\n"
                  "Step 2: Bar chart shows rise in specific departments\n"
                  "Step 3: Insight shows high cases of a disease\n"
                  "Step 4: Recommend more resources for that department",
            ),

            // DASHBOARD STORY
            sectionTitle("Using Dashboards for Storytelling"),

            explanation(
              "Dashboards help tell stories by combining visuals, filters, "
              "and explanations in one place.",
            ),

            infoBox(
              "Use titles to explain charts\n"
              "Highlight key numbers (KPIs)\n"
              "Guide users step-by-step\n"
              "Use colors to emphasize insights",
            ),

            // BEST PRACTICES
            sectionTitle("Best Practices"),

            infoBox(
              "Keep it simple and clear\n"
              "Focus on key insights\n"
              "Use visuals, not too much text\n"
              "Highlight important findings\n"
              "Always provide recommendations",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Storytelling = Data + Visuals + Explanation\n"
              "Helps decision-making\n"
              "Used in business and healthcare\n"
              "Final skill of a data analyst",
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
