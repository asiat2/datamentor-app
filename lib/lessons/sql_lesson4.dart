import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson4 extends StatefulWidget {
  const SqlLesson4({super.key});

  @override
  State<SqlLesson4> createState() => _SqlLesson4State();
}

class _SqlLesson4State extends State<SqlLesson4> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 4 — WHERE Clause") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 4 — WHERE Clause", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget queryBox(String query, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(query),
        ),
        Text(explanation),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 4 — WHERE Clause")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Text(
              "The WHERE clause filters rows in a SQL query. "
              "It allows retrieving only records that meet a condition.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Example Table: Customers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            DataTable(
              columns: const [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Country")),
                DataColumn(label: Text("Age")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("1")),
                    DataCell(Text("John")),
                    DataCell(Text("USA")),
                    DataCell(Text("32")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("2")),
                    DataCell(Text("Mary")),
                    DataCell(Text("UK")),
                    DataCell(Text("28")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("3")),
                    DataCell(Text("Ali")),
                    DataCell(Text("USA")),
                    DataCell(Text("35")),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Query Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT * FROM customers\nWHERE country = 'USA';",
              "This query returns only customers located in the USA.",
            ),

            queryBox(
              "SELECT * FROM customers\nWHERE age > 30;",
              "Returns customers older than 30.",
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
