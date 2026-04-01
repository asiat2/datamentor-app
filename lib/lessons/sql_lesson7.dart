import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson7 extends StatefulWidget {
  const SqlLesson7({super.key});

  @override
  State<SqlLesson7> createState() => _SqlLesson7State();
}

class _SqlLesson7State extends State<SqlLesson7> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 7 — ORDER BY") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 7 — ORDER BY", true);

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
      appBar: AppBar(title: const Text("Lesson 7 — ORDER BY")),

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
              "The ORDER BY clause is used to sort the result set of a SQL "
              "query. Sorting helps organize data in a meaningful way such "
              "as alphabetical order, numerical order, or chronological order.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Explanation of ASC and DESC
            const Text(
              "Sorting Types",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "ASC (Ascending) sorts data from smallest to largest or "
              "A → Z alphabetically. This is the default sorting order.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            const Text(
              "DESC (Descending) sorts data from largest to smallest or "
              "Z → A alphabetically.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Syntax
            const Text(
              "Syntax",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT column_name\nFROM table_name\nORDER BY column_name ASC;",
              "Sorts results in ascending order.",
            ),

            queryBox(
              "SELECT column_name\nFROM table_name\nORDER BY column_name DESC;",
              "Sorts results in descending order.",
            ),

            const SizedBox(height: 20),

            /// Examples
            const Text(
              "Examples",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "SELECT * FROM customers\nORDER BY age DESC;",
              "Sorts customers from highest age to lowest.",
            ),

            queryBox(
              "SELECT * FROM customers\nORDER BY age ASC;",
              "Sorts customers from youngest to oldest.",
            ),

            queryBox(
              "SELECT name, country\nFROM customers\nORDER BY name ASC;",
              "Sorts customers alphabetically by name.",
            ),

            queryBox(
              "SELECT name, country, age\nFROM customers\nORDER BY country ASC, age DESC;",
              "First sorts by country alphabetically, then sorts age from highest to lowest within each country.",
            ),

            const SizedBox(height: 20),

            /// Real Life Example
            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "A sales analyst might sort products by revenue in descending "
              "order to identify the top-selling products.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            queryBox(
              "SELECT product_name, revenue\nFROM sales\nORDER BY revenue DESC;",
              "Returns the highest revenue products first.",
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
