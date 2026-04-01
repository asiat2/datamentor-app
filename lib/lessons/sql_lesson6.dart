import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson6 extends StatefulWidget {
  const SqlLesson6({super.key});

  @override
  State<SqlLesson6> createState() => _SqlLesson6State();
}

class _SqlLesson6State extends State<SqlLesson6> {
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
          prefs.getBool("Lesson 6 — HAVING Clause") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 6 — HAVING Clause", true);

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
      appBar: AppBar(title: const Text("Lesson 6 — HAVING Clause")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Definition",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:10),

            const Text(
              "The HAVING clause filters grouped results in SQL. "
              "While WHERE filters rows before grouping, HAVING "
              "filters results after the GROUP BY operation.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Syntax",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "SELECT column, COUNT(*)\nFROM table\nGROUP BY column\nHAVING COUNT(*) > 1;",
              "Filters grouped results."
            ),

            const SizedBox(height:20),

            const Text(
              "Example Table",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            DataTable(
              columns: const [
                DataColumn(label: Text("Country")),
                DataColumn(label: Text("Customer")),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text("USA")),
                  DataCell(Text("John")),
                ]),
                DataRow(cells: [
                  DataCell(Text("USA")),
                  DataCell(Text("Ali")),
                ]),
                DataRow(cells: [
                  DataCell(Text("UK")),
                  DataCell(Text("Mary")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            queryBox(
              "SELECT country, COUNT(*)\nFROM customers\nGROUP BY country\nHAVING COUNT(*) > 1;",
              "Returns countries with more than one customer."
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