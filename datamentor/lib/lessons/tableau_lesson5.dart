import 'package:flutter/material.dart';

class TableauLesson5 extends StatelessWidget {
  const TableauLesson5({super.key});

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

  Widget formulaBox(String code, String desc) {
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
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 5 — Calculated Fields"),
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
              "Calculated fields allow you to create new columns or metrics "
              "from existing data using formulas in Tableau.",
            ),

            infoBox(
              "Think of calculated fields like Excel formulas, but used to create insights in dashboards.",
            ),

            // BASIC EXAMPLES
            sectionTitle("Basic Calculations"),

            formulaBox(
              "Profit = SUM([Sales]) - SUM([Cost])",
              "Calculates profit by subtracting cost from sales.",
            ),

            formulaBox(
              "Profit Ratio = SUM([Profit]) / SUM([Sales])",
              "Calculates profit percentage.",
            ),

            // CONDITIONAL LOGIC
            sectionTitle("Conditional Logic (IF)"),

            formulaBox(
              "IF [Sales] > 1000 THEN 'High' ELSE 'Low' END",
              "Categorizes sales into High or Low.",
            ),

            // STRING CALCULATION
            sectionTitle("Text Calculations"),

            formulaBox(
              "[First Name] + ' ' + [Last Name]",
              "Combines first and last name into full name.",
            ),

            // DATE CALCULATION
            sectionTitle("Date Calculations"),

            formulaBox(
              "YEAR([Order Date])",
              "Extracts year from a date field.",
            ),

            formulaBox(
              "MONTH([Order Date])",
              "Extracts month from a date field.",
            ),

            // AGGREGATION
            sectionTitle("Aggregations"),

            formulaBox(
              "AVG([Sales])",
              "Calculates average sales.",
            ),

            formulaBox(
              "COUNT([Customer ID])",
              "Counts number of customers.",
            ),

            // HEALTHCARE EXAMPLE
            sectionTitle("Healthcare Example"),

            formulaBox(
              "IF [Age] > 60 THEN 'Senior' ELSE 'Adult' END",
              "Classifies patients by age group.",
            ),

            formulaBox(
              "Patient Count = COUNT([Patient ID])",
              "Counts total number of patients.",
            ),

            // WHY IMPORTANT
            sectionTitle("Why Calculated Fields Are Important"),

            infoBox(
              "Create KPIs (Profit, Revenue)\n"
              "Add business logic (High/Low)\n"
              "Transform raw data into insights\n"
              "Used in all dashboards",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Calculated fields = custom formulas\n"
              "Use SUM, AVG, COUNT\n"
              "Use IF for logic\n"
              "Used to create insights and KPIs",
            ),

          ],
        ),
      ),
    );
  }
}