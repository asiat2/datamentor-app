import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson15 extends StatefulWidget {
  const SqlLesson15({super.key});

  @override
  State<SqlLesson15> createState() => _SqlLesson15State();
}

class _SqlLesson15State extends State<SqlLesson15> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 15 — SQL Index") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 15 — SQL Index", true);

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
      appBar: AppBar(title: const Text("Lesson 15 — SQL Index")),

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
              "An index is a database object used to improve the speed "
              "of data retrieval operations on a table. Instead of scanning "
              "every row in a table, the database can use an index to quickly "
              "locate the required data.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Why Indexes Are Important",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Indexes help databases perform faster searches. "
              "They are especially useful when working with large tables "
              "containing thousands or millions of records.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Example Table",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DataTable(
              columns: const [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Country")),
              ],

              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("1")),
                    DataCell(Text("John")),
                    DataCell(Text("USA")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("2")),
                    DataCell(Text("Mary")),
                    DataCell(Text("UK")),
                  ],
                ),

                DataRow(
                  cells: [
                    DataCell(Text("3")),
                    DataCell(Text("Ali")),
                    DataCell(Text("Canada")),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Create Index",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE INDEX idx_customer_name\n"
                  "ON customers(name);",

              "Creates an index on the name column "
                  "to speed up search queries.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Create Unique Index",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE UNIQUE INDEX idx_email\n"
                  "ON users(email);",

              "Ensures that all email values are unique "
                  "and improves search performance.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Drop Index",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "DROP INDEX idx_customer_name;",
              "Removes the index from the table.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Imagine a company database with millions of customers. "
              "Searching for a customer by name without an index would "
              "require scanning the entire table. With an index, the "
              "database can find the record instantly.",
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
