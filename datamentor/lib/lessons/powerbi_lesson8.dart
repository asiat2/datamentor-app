import 'package:flutter/material.dart';

class PowerBILesson8 extends StatelessWidget {
  const PowerBILesson8({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget codeBox(String code, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 8 — Introduction to DAX"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // DEFINITION
            sectionTitle("Definition"),
            explanation(
              "DAX (Data Analysis Expressions) is a formula language used in Power BI "
              "to create calculated columns, measures, and KPIs.",
            ),

            infoBox(
              "Think of DAX like Excel formulas but more powerful and used in dashboards.",
            ),

            // BASIC EXAMPLE
            sectionTitle("Basic Example"),

            codeBox(
              "Total Sales = SUM(Sales[Amount])",
              "This calculates the total sales by adding all values in the Amount column.",
            ),

            // MORE EXAMPLES
            sectionTitle("Common DAX Functions"),

            codeBox(
              "Average Sales = AVERAGE(Sales[Amount])",
              "Calculates the average sales value.",
            ),

            codeBox(
              "Total Orders = COUNT(Sales[OrderID])",
              "Counts the number of orders.",
            ),

            codeBox(
              "Max Sales = MAX(Sales[Amount])",
              "Finds the highest sales value.",
            ),

            codeBox(
              "Min Sales = MIN(Sales[Amount])",
              "Finds the lowest sales value.",
            ),

            // CONDITIONAL LOGIC
            sectionTitle("Conditional Example (IF)"),

            codeBox(
              "Sales Category = IF(Sales[Amount] > 1000, \"High\", \"Low\")",
              "Categorizes sales into High or Low based on value.",
            ),

            // CALCULATE FUNCTION
            sectionTitle("Using CALCULATE"),

            codeBox(
              "High Sales = CALCULATE(SUM(Sales[Amount]), Sales[Amount] > 1000)",
              "Calculates total sales only where sales are greater than 1000.",
            ),

            // HEALTHCARE EXAMPLE
            sectionTitle("Healthcare Example"),

            codeBox(
              "Total Patients = COUNT(Patients[PatientID])",
              "Counts total number of patients.",
            ),

            codeBox(
              "Avg Age = AVERAGE(Patients[Age])",
              "Calculates average patient age.",
            ),

            // MEASURE VS COLUMN
            sectionTitle("Measure vs Calculated Column"),

            infoBox(
              "Measure → Calculated dynamically (used in visuals)\n"
              "Calculated Column → Stored in table (row by row)",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "DAX is used to create calculations\n"
              "SUM, AVERAGE, COUNT are common\n"
              "IF adds conditions\n"
              "CALCULATE adds filters\n"
              "Used to build KPIs and advanced dashboards",
            ),

          ],
        ),
      ),
    );
  }
}