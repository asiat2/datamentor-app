import 'package:flutter/material.dart';

class SqlLesson3 extends StatelessWidget {
  const SqlLesson3({super.key});

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
        title: const Text("Lesson 3 — SELECT Statement"),
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
              "The SELECT statement retrieves data from a database table. "
              "It allows analysts to choose specific columns or retrieve "
              "all data from a table.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            /// Table Example
            const Text(
              "Example Table: Customers",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            DataTable(
              columns: const [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Country")),
                DataColumn(label: Text("Age")),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text("1")),
                  DataCell(Text("John")),
                  DataCell(Text("USA")),
                  DataCell(Text("32")),
                ]),
                DataRow(cells: [
                  DataCell(Text("2")),
                  DataCell(Text("Mary")),
                  DataCell(Text("UK")),
                  DataCell(Text("28")),
                ]),
                DataRow(cells: [
                  DataCell(Text("3")),
                  DataCell(Text("Ali")),
                  DataCell(Text("Canada")),
                  DataCell(Text("35")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            /// Query Examples
            const Text(
              "Query Examples",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT * FROM customers;",
              "Returns all rows and columns from the customers table."
            ),

            queryBox(
              "SELECT name, country FROM customers;",
              "Returns only the name and country columns."
            ),

            queryBox(
              "SELECT DISTINCT country FROM customers;",
              "Returns unique countries without duplicates."
            ),

            const SizedBox(height:20),

            /// Real-life example
            const Text(
              "Real-Life Example",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT name FROM customers;",
              "A company retrieves customer names for marketing emails."
            ),

          ],
        ),
      ),
    );
  }
}