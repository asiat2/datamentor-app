import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson14 extends StatefulWidget {
  const SqlLesson14({super.key});

  @override
  State<SqlLesson14> createState() => _SqlLesson14State();
}

class _SqlLesson14State extends State<SqlLesson14> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 14 — SQL Constraints") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 14 — SQL Constraints", true);

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
      appBar: AppBar(title: const Text("Lesson 14 — SQL Constraints")),

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
              "Constraints are rules applied to table columns to ensure "
              "data accuracy and integrity. They prevent invalid data "
              "from being inserted into the database.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "NOT NULL",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE TABLE employees (\n"
                  "id INT,\n"
                  "name VARCHAR(50) NOT NULL\n"
                  ");",
              "Ensures that the name column cannot contain NULL values.",
            ),

            const SizedBox(height: 20),

            const Text(
              "UNIQUE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE TABLE users (\n"
                  "email VARCHAR(100) UNIQUE\n"
                  ");",
              "Ensures that each email value is unique in the table.",
            ),

            const SizedBox(height: 20),

            const Text(
              "PRIMARY KEY",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE TABLE customers (\n"
                  "id INT PRIMARY KEY,\n"
                  "name VARCHAR(50)\n"
                  ");",
              "A primary key uniquely identifies each row in the table.",
            ),

            const SizedBox(height: 20),

            const Text(
              "FOREIGN KEY",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            queryBox(
              "CREATE TABLE orders (\n"
                  "order_id INT,\n"
                  "customer_id INT,\n"
                  "FOREIGN KEY (customer_id)\n"
                  "REFERENCES customers(id)\n"
                  ");",
              "A foreign key creates a relationship between two tables.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Example Relationship",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Customers table contains customer information. "
              "Orders table stores orders placed by customers. "
              "The foreign key ensures that an order cannot exist "
              "without a valid customer.",
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
