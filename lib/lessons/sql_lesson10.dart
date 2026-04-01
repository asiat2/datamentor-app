import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson10 extends StatefulWidget {
  const SqlLesson10({super.key});

  @override
  State<SqlLesson10> createState() => _SqlLesson10State();
}

class _SqlLesson10State extends State<SqlLesson10> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 10 — Window Functions") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 10 — Window Functions", true);

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
      appBar: AppBar(title: const Text("Lesson 10 — Window Functions")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Definition
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Window functions perform calculations across a set of rows "
              "related to the current row without collapsing the result into "
              "a single row. Unlike GROUP BY, window functions allow each row "
              "to maintain its identity while still performing calculations.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            const Text(
              "Common window functions include ROW_NUMBER(), RANK(), and "
              "DENSE_RANK(). These functions are commonly used in data "
              "analysis for ranking, ordering, and comparing rows.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Syntax
            const Text(
              "Syntax",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT column_name,\n"
                  "WINDOW_FUNCTION() OVER (ORDER BY column)\n"
                  "FROM table;",
              "Basic syntax of a window function.",
            ),

            const SizedBox(height: 20),

            /// Example Table
            const Text(
              "Example Table",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DataTable(
              columns: const [
                DataColumn(label: Text("Employee")),
                DataColumn(label: Text("Department")),
                DataColumn(label: Text("Salary")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("John")),
                    DataCell(Text("IT")),
                    DataCell(Text("7000")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Mary")),
                    DataCell(Text("IT")),
                    DataCell(Text("6500")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("David")),
                    DataCell(Text("HR")),
                    DataCell(Text("6000")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Anna")),
                    DataCell(Text("HR")),
                    DataCell(Text("5500")),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ROW_NUMBER
            const Text(
              "ROW_NUMBER()",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT employee, salary,\n"
                  "ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank\n"
                  "FROM employees;",
              "ROW_NUMBER assigns a unique sequential number to each row.",
            ),

            const Text(
              "In this example, employees are ranked based on salary from "
              "highest to lowest.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// RANK
            const Text(
              "RANK()",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT employee, salary,\n"
                  "RANK() OVER (ORDER BY salary DESC) AS rank\n"
                  "FROM employees;",
              "RANK assigns ranking numbers but allows ties.",
            ),

            const Text(
              "If two employees have the same salary, they receive the same "
              "rank and the next rank number is skipped.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// DENSE RANK
            const Text(
              "DENSE_RANK()",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT employee, salary,\n"
                  "DENSE_RANK() OVER (ORDER BY salary DESC) AS rank\n"
                  "FROM employees;",
              "DENSE_RANK assigns ranking numbers but does NOT skip numbers after ties.",
            ),

            const Text(
              "Unlike RANK, DENSE_RANK does not skip ranking numbers after ties.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Real Life Example
            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT product_name, sales,\n"
                  "RANK() OVER (ORDER BY sales DESC) AS sales_rank\n"
                  "FROM products;",
              "This query ranks products based on total sales, helping analysts "
                  "identify top-performing products.",
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
