import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson1 extends StatefulWidget {
  const TableauLesson1({super.key});

  @override
  State<TableauLesson1> createState() => _TableauLesson1State();
}

class _TableauLesson1State extends State<TableauLesson1> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted =
          prefs.getBool("Lesson 1 — Introduction to Tableau") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 1 — Introduction to Tableau", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Text(text, style: const TextStyle(fontSize: 16));
  }

  Widget exampleBox(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 1 — Introduction to Tableau")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Definition
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            explanation(
              "Tableau is a powerful data visualization and business "
              "intelligence tool used to analyze data and create "
              "interactive dashboards. It allows users to connect "
              "to multiple data sources, transform data, and build "
              "visual reports without complex programming.",
            ),

            const SizedBox(height: 20),

            explanation(
              "Tableau helps organizations turn raw data into "
              "insights by presenting information through charts, "
              "graphs, maps, and dashboards.",
            ),

            /// Why Tableau
            sectionTitle("Why Tableau is Important"),

            explanation(
              "Tableau is widely used by data analysts, business "
              "analysts, and organizations to understand trends, "
              "monitor performance, and support decision-making.",
            ),

            exampleBox(
              "Example:\n"
              "A retail company can use Tableau to analyze sales "
              "performance by region, product category, and time.",
            ),

            /// Tableau Products
            sectionTitle("Tableau Products"),

            explanation(
              "Tableau provides several tools designed for different "
              "data analysis tasks.",
            ),

            const SizedBox(height: 10),

            const Text(
              "Tableau Desktop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "Used by analysts to connect data, build charts, and "
              "create dashboards.",
            ),

            const SizedBox(height: 10),

            const Text(
              "Tableau Server",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "Allows organizations to share dashboards securely "
              "within the company.",
            ),

            const SizedBox(height: 10),

            const Text(
              "Tableau Online",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "A cloud-based version of Tableau Server used to share "
              "reports and dashboards online.",
            ),

            const SizedBox(height: 10),

            const Text(
              "Tableau Public",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "A free version of Tableau used for learning and "
              "publishing visualizations publicly.",
            ),

            /// Real Use Case
            sectionTitle("Real-World Example"),

            explanation("A hospital can use Tableau dashboards to monitor:"),

            exampleBox(
              "• Patient admissions\n"
              "• Average treatment time\n"
              "• Hospital resource utilization\n"
              "• Patient satisfaction scores",
            ),

            /// Summary
            sectionTitle("Key Takeaways"),

            exampleBox(
              "Tableau allows users to:\n\n"
              "✔ Connect to multiple data sources\n"
              "✔ Analyze data visually\n"
              "✔ Create interactive dashboards\n"
              "✔ Share insights with organizations",
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
