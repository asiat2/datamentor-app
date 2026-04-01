import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson2 extends StatefulWidget {
  const SqlLesson2({super.key});

  @override
  State<SqlLesson2> createState() => _SqlLesson2State();
}

class _SqlLesson2State extends State<SqlLesson2> {
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
          prefs.getBool("Lesson 2 — SQL Query Execution Order") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 2 — SQL Query Execution Order", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget step(String title, String explanation) {
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

          Text(explanation),
        ],
      ),
    );
  }

  Widget exampleBox(String query, String explanation) {
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

        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 2 — SQL Query Execution Order")),

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
              "SQL queries follow a logical execution order when retrieving "
              "data from a database. Even though the SELECT statement appears "
              "first in a query, the database processes the query in a different order.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Logical Execution Order",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            step("1. FROM", "The database identifies the table being queried."),

            step(
              "2. WHERE",
              "Rows are filtered based on specified conditions.",
            ),

            step("3. GROUP BY", "Rows are grouped into categories."),

            step("4. HAVING", "Filters grouped results after aggregation."),

            step(
              "5. SELECT",
              "Columns are selected to appear in the final result.",
            ),

            step("6. ORDER BY", "The result set is sorted."),

            step("7. LIMIT", "Restricts the number of rows returned."),

            const SizedBox(height: 20),

            const Text(
              "Example Query",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox(
              "SELECT country, COUNT(*)\n"
                  "FROM customers\n"
                  "WHERE age > 30\n"
                  "GROUP BY country\n"
                  "ORDER BY COUNT(*) DESC\n"
                  "LIMIT 5;",
              "This query returns the top 5 countries with the highest "
                  "number of customers older than 30.",
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
