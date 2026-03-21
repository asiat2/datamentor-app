import 'package:flutter/material.dart';

class TableauLesson7 extends StatelessWidget {
  const TableauLesson7({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
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
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold)),
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
        title: const Text("Lesson 7 — Groups and Bins"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GROUPS
            sectionTitle("Groups"),

            explanation(
              "Groups combine multiple dimension values into a single category. "
              "This helps simplify data and make it easier to analyze.",
            ),

            infoBox(
              "Use Groups when you want to combine categories manually.",
            ),

            exampleBox(
              "Example 1 (Geography)",
              "Cities: New York, Boston → Group as 'North'\n"
              "Cities: Miami, Atlanta → Group as 'South'",
            ),

            exampleBox(
              "Example 2 (Healthcare)",
              "Departments: Cardiology, Neurology → Group as 'Specialized Care'\n"
              "Departments: General, Pediatrics → Group as 'General Care'",
            ),

            exampleBox(
              "Example 3 (Business)",
              "Products: Laptop, Phone → Group as 'Electronics'",
            ),

            // BINS
            sectionTitle("Bins"),

            explanation(
              "Bins divide numerical data into ranges (intervals). "
              "This helps analyze distributions and patterns.",
            ),

            infoBox(
              "Use Bins when working with numbers like Age, Sales, or Income.",
            ),

            exampleBox(
              "Example 1 (Age Groups)",
              "0–20 → Young\n"
              "21–40 → Adult\n"
              "41–60 → Middle Age\n"
              "60+ → Senior",
            ),

            exampleBox(
              "Example 2 (Sales)",
              "0–1000 → Low Sales\n"
              "1000–5000 → Medium Sales\n"
              "5000+ → High Sales",
            ),

            exampleBox(
              "Example 3 (Healthcare)",
              "Patient Age Bins to analyze disease risk by age group.",
            ),

            // DIFFERENCE
            sectionTitle("Groups vs Bins"),

            infoBox(
              "Groups → Combine categories (text data)\n"
              "Bins → Create ranges (numeric data)\n"
              "Groups = manual\n"
              "Bins = automatic ranges",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Groups simplify categories\n"
              "Bins organize numbers into ranges\n"
              "Both improve analysis and visualization\n"
              "Very useful for dashboards",
            ),

          ],
        ),
      ),
    );
  }
}