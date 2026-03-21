import 'package:flutter/material.dart';

class SqlLesson8 extends StatelessWidget {
  const SqlLesson8({super.key});

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
        title: const Text("Lesson 8 — SQL JOIN Types"),
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
              "A JOIN clause combines rows from two or more tables "
              "based on a related column between them. JOIN allows "
              "SQL queries to retrieve data stored across multiple "
              "tables in relational databases.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            /// Example Tables
            const Text(
              "Example Tables",
              style: TextStyle(
                fontSize:22,
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
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
              ],
              rows: const [
                DataRow(cells:[
                  DataCell(Text("1")),
                  DataCell(Text("John")),
                ]),
                DataRow(cells:[
                  DataCell(Text("2")),
                  DataCell(Text("Mary")),
                ]),
                DataRow(cells:[
                  DataCell(Text("3")),
                  DataCell(Text("David")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            const Text(
              "Orders Table",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            DataTable(
              columns: const [
                DataColumn(label: Text("OrderID")),
                DataColumn(label: Text("CustomerID")),
                DataColumn(label: Text("Amount")),
              ],
              rows: const [
                DataRow(cells:[
                  DataCell(Text("101")),
                  DataCell(Text("1")),
                  DataCell(Text("500")),
                ]),
                DataRow(cells:[
                  DataCell(Text("102")),
                  DataCell(Text("2")),
                  DataCell(Text("300")),
                ]),
              ],
            ),

            const SizedBox(height:20),

            /// INNER JOIN
            const Text(
              "INNER JOIN",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT customers.name, orders.amount\n"
              "FROM customers\n"
              "INNER JOIN orders\n"
              "ON customers.id = orders.customer_id;",
              "Returns only rows that have matching values in both tables."
            ),

            /// LEFT JOIN
            const Text(
              "LEFT JOIN",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT customers.name, orders.amount\n"
              "FROM customers\n"
              "LEFT JOIN orders\n"
              "ON customers.id = orders.customer_id;",
              "Returns all rows from the left table (customers) and matching rows from orders."
            ),

            /// RIGHT JOIN
            const Text(
              "RIGHT JOIN",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT customers.name, orders.amount\n"
              "FROM customers\n"
              "RIGHT JOIN orders\n"
              "ON customers.id = orders.customer_id;",
              "Returns all rows from the right table (orders) and matching rows from customers."
            ),

            /// FULL JOIN
            const Text(
              "FULL JOIN",
              style: TextStyle(
                fontSize:20,
                fontWeight:FontWeight.bold,
              ),
            ),

            queryBox(
              "SELECT customers.name, orders.amount\n"
              "FROM customers\n"
              "FULL JOIN orders\n"
              "ON customers.id = orders.customer_id;",
              "Returns all rows when there is a match in either table."
            ),

          ],
        ),
      ),
    );
  }
}