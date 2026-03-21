import 'package:flutter/material.dart';

class SqlLesson11 extends StatelessWidget {
  const SqlLesson11({super.key});

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
      appBar: AppBar(
        title: const Text("Lesson 11 — SQL Views"),
      ),

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
              "A View is a virtual table created from a SQL query. "
              "It does not store data physically but instead stores "
              "the SQL query used to generate the result.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Why Views Are Used",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:10),

            const Text(
              "Views help simplify complex queries, improve security "
              "by restricting access to certain columns, and make "
              "data easier to analyze.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Syntax",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "CREATE VIEW view_name AS\n"
              "SELECT column1, column2\n"
              "FROM table_name;",
              "This creates a view based on a query."
            ),

            const SizedBox(height:20),

            const Text(
              "Example Table",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:10),

            DataTable(
              columns: const [
                DataColumn(label: Text("CustomerID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Country")),
              ],
              rows: const [
                DataRow(cells:[
                  DataCell(Text("1")),
                  DataCell(Text("John")),
                  DataCell(Text("USA")),
                ]),
                DataRow(cells:[
                  DataCell(Text("2")),
                  DataCell(Text("Mary")),
                  DataCell(Text("UK")),
                ]),
                DataRow(cells:[
                  DataCell(Text("3")),
                  DataCell(Text("Ali")),
                  DataCell(Text("USA")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            const Text(
              "Example — Creating a View",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "CREATE VIEW usa_customers AS\n"
              "SELECT name, country\n"
              "FROM customers\n"
              "WHERE country = 'USA';",
              "Creates a view that contains only customers from the USA."
            ),

            const SizedBox(height:20),

            const Text(
              "Querying the View",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "SELECT * FROM usa_customers;",
              "Retrieves the data stored in the view."
            ),

            const SizedBox(height:20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const Text(
              "In a company database, analysts might create a view "
              "that shows only active customers so that reports "
              "can be generated faster without writing the same "
              "query repeatedly.",
              style: TextStyle(fontSize:16),
            ),

          ],
        ),
      ),
    );
  }
}