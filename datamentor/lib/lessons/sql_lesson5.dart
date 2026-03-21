import 'package:flutter/material.dart';

class SqlLesson5 extends StatelessWidget {
  const SqlLesson5({super.key});

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
        title: const Text("Lesson 5 — GROUP BY"),
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
              "The GROUP BY clause groups rows that have the same values "
              "in specified columns into summary rows. It is commonly used "
              "with aggregate functions such as COUNT(), SUM(), AVG(), "
              "MIN(), and MAX().",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            /// Syntax
            const Text(
              "Syntax",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT column_name, AGGREGATE_FUNCTION(column_name)\n"
              "FROM table_name\n"
              "GROUP BY column_name;",
              "Groups rows with the same value in a column."
            ),

            const SizedBox(height:20),

            /// Example Table
            const Text(
              "Example Table: Customers",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

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

            /// Query Example
            const Text(
              "Query Example",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT country, COUNT(*)\n"
              "FROM customers\n"
              "GROUP BY country;",
              "This query counts the number of customers in each country."
            ),

            queryBox(
              "SELECT country, COUNT(customer)\n"
              "FROM customers\n"
              "GROUP BY country;",
              "Returns how many customers exist in each country."
            ),

            const SizedBox(height:20),

            /// Real Life Example
            const Text(
              "Real-Life Example",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            const Text(
              "A business analyst may group customers by country "
              "to understand where most customers are located.",
              style: TextStyle(fontSize:16),
            ),

          ],
        ),
      ),
    );
  }
}