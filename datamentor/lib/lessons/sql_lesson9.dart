import 'package:flutter/material.dart';

class SqlLesson9 extends StatelessWidget {
  const SqlLesson9({super.key});

  Widget queryBox(String query, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical:8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(query),
        ),

        Text(explanation),

        const SizedBox(height:12),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9 — UNION vs UNION ALL"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Definition
            const Text(
              "Definition",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "The UNION operator is used to combine the results of two "
              "or more SELECT statements into a single result set. "
              "Each SELECT statement must have the same number of columns "
              "and compatible data types.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:10),

            const Text(
              "UNION removes duplicate rows from the result set, while "
              "UNION ALL keeps all rows including duplicates.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            /// Syntax
            const Text(
              "Syntax",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT column_name FROM table1\n"
              "UNION\n"
              "SELECT column_name FROM table2;",
              "Combines results from two SELECT queries and removes duplicates."
            ),

            queryBox(
              "SELECT column_name FROM table1\n"
              "UNION ALL\n"
              "SELECT column_name FROM table2;",
              "Combines results from two SELECT queries and keeps duplicates."
            ),

            const SizedBox(height:20),

            /// Example Tables
            const Text(
              "Example Tables",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "Customers Table",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
              ],
              rows: const [
                DataRow(cells:[
                  DataCell(Text("John")),
                ]),
                DataRow(cells:[
                  DataCell(Text("Mary")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            const Text(
              "Suppliers Table",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
              ],
              rows: const [
                DataRow(cells:[
                  DataCell(Text("Mary")),
                ]),
                DataRow(cells:[
                  DataCell(Text("David")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            /// UNION Example
            const Text(
              "Example — UNION",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT name FROM customers\n"
              "UNION\n"
              "SELECT name FROM suppliers;",
              "This query combines both tables and removes duplicate names. "
              "Result: John, Mary, David."
            ),

            const SizedBox(height:20),

            /// UNION ALL Example
            const Text(
              "Example — UNION ALL",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT name FROM customers\n"
              "UNION ALL\n"
              "SELECT name FROM suppliers;",
              "This query combines both tables and keeps duplicate values. "
              "Result: John, Mary, Mary, David."
            ),

            const SizedBox(height:20),

            /// Key Difference
            const Text(
              "Key Difference",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "UNION removes duplicate records, which may take more processing time. "
              "UNION ALL is faster because it simply combines the results without "
              "checking for duplicates.",
              style: TextStyle(fontSize:16),
            ),

          ],
        ),
      ),
    );
  }
}