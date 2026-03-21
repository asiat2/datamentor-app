import 'package:flutter/material.dart';

class PowerBILesson9 extends StatelessWidget {
  const PowerBILesson9({super.key});

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

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget codeBox(String code, String desc) {
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
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
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
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9 — Measures and Calculations"),
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
              "Measures are dynamic calculations created using DAX. "
              "They update automatically based on filters and visuals in your report.",
            ),

            infoBox(
              "Think of measures as live calculations that change depending on what the user selects.",
            ),

            // BASIC EXAMPLES
            sectionTitle("Basic Measures"),

            codeBox(
              "Total Sales = SUM(Sales[Amount])",
              "Adds all sales values to get total revenue.",
            ),

            codeBox(
              "Average Sales = AVERAGE(Sales[Amount])",
              "Calculates the average sales amount.",
            ),

            codeBox(
              "Total Orders = COUNT(Sales[OrderID])",
              "Counts the number of orders.",
            ),

            // FILTERED MEASURE
            sectionTitle("Filtered Measures"),

            codeBox(
              "High Sales = CALCULATE(SUM(Sales[Amount]), Sales[Amount] > 1000)",
              "Calculates total sales where amount is greater than 1000.",
            ),

            // KPI MEASURES
            sectionTitle("KPI Measures"),

            codeBox(
              "Profit = SUM(Sales[Revenue]) - SUM(Sales[Cost])",
              "Calculates profit by subtracting cost from revenue.",
            ),

            codeBox(
              "Profit Margin = DIVIDE([Profit], SUM(Sales[Revenue]))",
              "Calculates profit percentage safely.",
            ),

            // TIME BASED
            sectionTitle("Time-Based Measures"),

            codeBox(
              "Monthly Sales = CALCULATE(SUM(Sales[Amount]), MONTH(Sales[Date]) = 1)",
              "Calculates sales for a specific month (January).",
            ),

            // HEALTHCARE EXAMPLE
            sectionTitle("Healthcare Example"),

            codeBox(
              "Total Patients = COUNT(Patients[PatientID])",
              "Counts total number of patients.",
            ),

            codeBox(
              "Avg Patient Age = AVERAGE(Patients[Age])",
              "Calculates average patient age.",
            ),

            codeBox(
              "Senior Patients = CALCULATE(COUNT(Patients[PatientID]), Patients[Age] > 60)",
              "Counts patients older than 60.",
            ),

            // WHY MEASURES
            sectionTitle("Why Measures Are Important"),

            infoBox(
              "They update automatically with filters\n"
              "They are used in charts and dashboards\n"
              "They help create KPIs\n"
              "They enable advanced analytics",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Measures = dynamic calculations\n"
              "Use SUM, AVERAGE, COUNT\n"
              "Use CALCULATE for filtering\n"
              "Used to build KPIs and insights",
            ),

          ],
        ),
      ),
    );
  }
}