import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson5 extends StatefulWidget {
  const TableauLesson5({super.key});

  @override
  State<TableauLesson5> createState() => _TableauLesson5State();
}

class _TableauLesson5State extends State<TableauLesson5> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 5 — Calculated Fields") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 5 — Calculated Fields", true);

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
          Text(desc, style: const TextStyle(color: Colors.white)),
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

            formulaBox("AVG([Sales])", "Calculates average sales."),

            formulaBox("COUNT([Customer ID])", "Counts number of customers."),

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
