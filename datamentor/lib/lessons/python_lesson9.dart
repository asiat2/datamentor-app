import 'package:flutter/material.dart';

class PythonLesson9 extends StatelessWidget {
  const PythonLesson9({super.key});

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

          ],
        ),
      ),
    );
  }
}