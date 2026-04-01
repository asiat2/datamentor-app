import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson13 extends StatefulWidget {
  const SqlLesson13({super.key});

  @override
  State<SqlLesson13> createState() => _SqlLesson13State();
}

class _SqlLesson13State extends State<SqlLesson13> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 13 — SQL Table Operations") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 13 — SQL Table Operations", true);

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
      appBar: AppBar(title: const Text("Lesson 13 — SQL Table Operations")),

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
              "SQL provides commands to create, modify, and remove tables or records "
              "from a database. These commands allow database administrators and "
              "data analysts to manage database structures and stored data.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "CREATE TABLE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE TABLE customers (\n"
                  "id INT,\n"
                  "name VARCHAR(50),\n"
                  "country VARCHAR(50)\n"
                  ");",
              "Creates a new table called customers with three columns.",
            ),

            const SizedBox(height: 20),

            const Text(
              "ALTER TABLE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "ALTER TABLE customers\n"
                  "ADD age INT;",
              "Adds a new column called age to the customers table.",
            ),

            const SizedBox(height: 20),

            const Text(
              "DROP TABLE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "DROP TABLE customers;",
              "Deletes the entire table including its structure and data.",
            ),

            const SizedBox(height: 20),

            const Text(
              "DELETE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "DELETE FROM customers\n"
                  "WHERE country = 'USA';",
              "Deletes rows where the country is USA but keeps the table structure.",
            ),

            const SizedBox(height: 20),

            const Text(
              "TRUNCATE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "TRUNCATE TABLE customers;",
              "Removes all rows from the table very quickly but keeps the table structure.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Difference Between DELETE and TRUNCATE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "DELETE removes rows one by one and allows conditions using WHERE. "
              "TRUNCATE removes all rows instantly and cannot use WHERE.",
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
