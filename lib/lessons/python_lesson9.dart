import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLesson9 extends StatefulWidget {
  const PythonLesson9({super.key});

  @override
  State<PythonLesson9> createState() => _PythonLesson9State();
}

class _PythonLesson9State extends State<PythonLesson9> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 9 — Filtering & Aggregation") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 9 — Filtering & Aggregation", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget explanationText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget codeBox(String code, String explanation) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            explanation,
            style: const TextStyle(color: Colors.white),
          ),
        ],
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
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9 — Filtering & Aggregation"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // INTRO
            sectionTitle("Definition"),
            explanationText(
              "Filtering selects specific rows based on conditions. "
              "Aggregation calculates summary statistics like sum, average, or count.",
            ),

            // FILTERING
            sectionTitle("Filtering Data"),
            infoBox("Filtering helps you focus on specific data."),
            codeBox(
              "df[df['Age'] > 30]",
              "Returns rows where Age is greater than 30.",
            ),
            codeBox(
              "df[df['Gender'] == 'Female']",
              "Returns only female records.",
            ),
            codeBox(
              "df[(df['Age'] > 25) & (df['Salary'] > 5000)]",
              "Filters rows where Age > 25 AND Salary > 5000.",
            ),

            // AGGREGATION
            sectionTitle("Aggregation"),
            infoBox("Aggregation summarizes data."),
            codeBox(
              "df['Sales'].sum()",
              "Calculates total sales.",
            ),
            codeBox(
              "df['Age'].mean()",
              "Calculates average age.",
            ),
            codeBox(
              "df['Salary'].max()",
              "Finds highest salary.",
            ),
            codeBox(
              "df['Age'].count()",
              "Counts number of records.",
            ),

            // GROUP BY
            sectionTitle("Group By (Very Important)"),
            infoBox("Group data and apply aggregation."),
            codeBox(
              "df.groupby('Department')['Salary'].mean()",
              "Calculates average salary per department.",
            ),
            codeBox(
              "df.groupby('Gender')['Age'].mean()",
              "Average age for each gender.",
            ),

            // MULTIPLE AGGREGATIONS
            sectionTitle("Multiple Aggregations"),
            infoBox("Apply multiple calculations at once."),
            codeBox(
              "df.groupby('Department')['Salary'].agg(['mean','max','min'])",
              "Shows mean, max, and min salary per department.",
            ),

            // REAL-LIFE EXAMPLE
            sectionTitle("Real-Life Example"),
            infoBox("Example from healthcare or business data."),
            codeBox(
              "df[df['Diagnosis'] == 'Diabetes']",
              "Filters patients with diabetes.",
            ),
            codeBox(
              "df.groupby('Hospital')['Patients'].sum()",
              "Total number of patients per hospital.",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "Filtering → Select rows using conditions\n"
              "Aggregation → Calculate summary values\n"
              "GroupBy → Combine filtering + aggregation\n"
              "Very important for dashboards & analysis",
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