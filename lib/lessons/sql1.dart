import 'package:flutter/material.dart';

class SqlLesson1 extends StatelessWidget {
  const SqlLesson1({super.key});

  Widget commandBox(String command, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              command,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 4),

          Text(description),
        ],
      ),
    );
  }

  Widget exampleBox(String code, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(code, style: const TextStyle(fontSize: 16)),
        ),

        Text(explanation),

        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 1 — What is SQL")),

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
              "SQL (Structured Query Language) is used to communicate with "
              "databases. It allows users to store, retrieve, update, and "
              "delete data in relational database systems such as MySQL, "
              "PostgreSQL, SQL Server, and Oracle.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Important Commands
            const Text(
              "Most Important SQL Commands",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            commandBox("SELECT", "Extracts data from a database"),

            commandBox("UPDATE", "Updates existing data in a database"),

            commandBox("DELETE", "Deletes records from a database"),

            commandBox("INSERT INTO", "Inserts new records into a table"),

            commandBox("CREATE DATABASE", "Creates a new database"),

            commandBox("ALTER DATABASE", "Modifies an existing database"),

            commandBox("CREATE TABLE", "Creates a new table"),

            commandBox("ALTER TABLE", "Modifies the structure of a table"),

            commandBox("DROP TABLE", "Deletes a table"),

            commandBox("CREATE INDEX", "Creates an index to speed up searches"),

            commandBox("DROP INDEX", "Deletes an index"),

            const SizedBox(height: 20),

            /// Semicolon
            const Text(
              "Semicolon After SQL Statements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Some database systems require a semicolon (;) at the end of "
              "each SQL statement. The semicolon is used to separate multiple "
              "SQL statements that are executed in the same request to the "
              "database server.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Example
            const Text(
              "Example Query",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox(
              "SELECT * FROM customers;",
              "This query retrieves all columns and rows from the customers table.",
            ),

            exampleBox(
              "SELECT name, country FROM customers;",
              "This query retrieves only the name and country columns.",
            ),

            const SizedBox(height: 20),

            /// Real life example
            const Text(
              "Real Life Example",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            exampleBox(
              "SELECT * FROM orders;",
              "An e-commerce analyst retrieves all customer orders.",
            ),
          ],
        ),
      ),
    );
  }
}
