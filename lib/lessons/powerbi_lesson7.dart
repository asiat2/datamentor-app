import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PowerBILesson7 extends StatefulWidget {
  const PowerBILesson7({super.key});

  @override
  State<PowerBILesson7> createState() => _PowerBILesson7State();
}

class _PowerBILesson7State extends State<PowerBILesson7> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 7 — Data Modeling") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 7 — Data Modeling", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Text(text, style: const TextStyle(fontSize: 16));
  }

  Widget exampleBox(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 7 — Data Modeling")),

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

            explanation(
              "A Data Model in Power BI represents how different tables "
              "in a dataset are connected through relationships. "
              "It allows Power BI to combine data from multiple tables "
              "so analysts can perform calculations, build reports, "
              "and generate meaningful insights.",
            ),

            const SizedBox(height: 10),

            explanation(
              "Instead of storing all information in one table, Power BI "
              "organizes data into multiple related tables, similar to "
              "a relational database.",
            ),

            /// Example
            sectionTitle("Example Data Model"),

            explanation("A sales analysis dataset might include these tables:"),

            exampleBox(
              "Customers Table\n"
              "CustomerID | Name | Country",
            ),

            exampleBox(
              "Orders Table\n"
              "OrderID | CustomerID | OrderDate | SalesAmount",
            ),

            explanation("The relationship is created using CustomerID."),

            exampleBox("Customers.CustomerID  →  Orders.CustomerID"),

            /// Cardinality
            sectionTitle("Relationship Cardinality"),

            explanation(
              "Cardinality defines how rows from one table relate "
              "to rows in another table.",
            ),

            const SizedBox(height: 10),

            const Text(
              "1️⃣ One-to-One (1:1)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "Each record in Table A matches exactly one record "
              "in Table B.",
            ),

            exampleBox(
              "Employee Table ↔ EmployeeDetails Table\n"
              "EmployeeID connects both tables.",
            ),

            const Text(
              "2️⃣ One-to-Many (1:*)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "One record in the first table relates to multiple "
              "records in the second table.",
            ),

            exampleBox(
              "Customers Table → Orders Table\n"
              "One customer can have many orders.",
            ),

            const Text(
              "3️⃣ Many-to-Many (*:*)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation(
              "Multiple records in one table relate to multiple "
              "records in another table.",
            ),

            exampleBox(
              "Students Table ↔ Courses Table\n"
              "Students can enroll in many courses, and each course "
              "can have many students.",
            ),

            /// Relationship Direction
            sectionTitle("Relationship Filter Direction"),

            explanation(
              "Power BI also controls how filters flow between tables.",
            ),

            const SizedBox(height: 10),

            const Text(
              "Single Direction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation("Filtering flows from one table to another."),

            exampleBox(
              "Customers → Orders\n"
              "Filtering Customers automatically filters Orders.",
            ),

            const Text(
              "Both Direction (Bi-directional)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            explanation("Filtering flows between both tables."),

            exampleBox(
              "Customers ↔ Orders\n"
              "Filtering Orders also filters Customers.",
            ),

            /// Why Data Models Matter
            sectionTitle("Why Data Models Are Important"),

            explanation(
              "A well-designed data model improves performance, "
              "simplifies analysis, and ensures accurate calculations "
              "when creating dashboards and reports.",
            ),

            exampleBox("Good Data Model → Faster Reports + Accurate Insights"),
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
