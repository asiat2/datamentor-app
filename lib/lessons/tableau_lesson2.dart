import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson2 extends StatefulWidget {
  const TableauLesson2({super.key});

  @override
  State<TableauLesson2> createState() => _TableauLesson2State();
}

class _TableauLesson2State extends State<TableauLesson2> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 2 — Connecting Data") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 2 — Connecting Data", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 2 — Connecting Data")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Connecting data is the first step when building visualizations "
              "in Tableau. Tableau can connect to many different data sources "
              "such as Excel, CSV files, SQL databases, and cloud platforms.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Common Data Sources",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "• Excel files\n"
              "• CSV files\n"
              "• SQL Server\n"
              "• MySQL\n"
              "• Google Sheets\n"
              "• Cloud Data Warehouses",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            section(
              "Live Connection (Direct Query)",
              "A live connection allows Tableau to query the data directly "
                  "from the source database every time a visualization is updated. "
                  "This ensures the dashboard always displays the most recent data.",
            ),

            const Text(
              "Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const Text(
              "A company connects Tableau directly to a SQL database "
              "to monitor real-time sales transactions.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            section(
              "Extract Connection",
              "An extract connection creates a snapshot of the data and "
                  "stores it inside Tableau. Extracts improve performance "
                  "because Tableau queries the local extracted dataset "
                  "instead of the original database.",
            ),

            const Text(
              "Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const Text(
              "A company extracts a large sales dataset from a data warehouse "
              "so dashboards load faster during analysis.",
              style: TextStyle(fontSize: 16),
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
