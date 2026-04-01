import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlLesson12 extends StatefulWidget {
  const SqlLesson12({super.key});

  @override
  State<SqlLesson12> createState() => _SqlLesson12State();
}

class _SqlLesson12State extends State<SqlLesson12> {
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
          prefs.getBool("Lesson 12 — Stored Procedures") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 12 — Stored Procedures", true);

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
      appBar: AppBar(
        title: const Text("Lesson 12 — Stored Procedures"),
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
              "A Stored Procedure is a saved SQL program that can be "
              "executed multiple times. It allows developers and "
              "analysts to reuse SQL logic instead of writing the "
              "same query repeatedly.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Why Stored Procedures Are Useful",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:10),

            const Text(
              "Stored procedures improve performance, increase "
              "security, and simplify complex database operations.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Syntax",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "CREATE PROCEDURE procedure_name\n"
              "AS\n"
              "SELECT * FROM table_name;",
              "Creates a stored procedure."
            ),

            const SizedBox(height:20),

            const Text(
              "Example — Create Procedure",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "CREATE PROCEDURE GetCustomers\n"
              "AS\n"
              "SELECT * FROM customers;",
              "Creates a stored procedure that retrieves all customers."
            ),

            const SizedBox(height:20),

            const Text(
              "Executing a Stored Procedure",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "EXEC GetCustomers;",
              "Runs the stored procedure."
            ),

            const SizedBox(height:20),

            const Text(
              "Stored Procedure With Parameters",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "CREATE PROCEDURE GetCustomerByCountry\n"
              "@country VARCHAR(50)\n"
              "AS\n"
              "SELECT * FROM customers\n"
              "WHERE country = @country;",
              "Creates a procedure that filters customers by country."
            ),

            const SizedBox(height:20),

            const Text(
              "Executing the Parameter Procedure",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            queryBox(
              "EXEC GetCustomerByCountry 'USA';",
              "Returns customers located in the USA."
            ),

            const SizedBox(height:20),

            const Text(
              "Real-Life Example",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const Text(
              "In a banking system, stored procedures are often "
              "used to process transactions, update account balances, "
              "and generate financial reports.",
              style: TextStyle(fontSize:16),
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