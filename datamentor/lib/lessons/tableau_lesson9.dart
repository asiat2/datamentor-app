import 'package:flutter/material.dart';

class TableauLesson9 extends StatelessWidget {
  const TableauLesson9({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
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
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9 — Level of Detail (LOD)"),
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
              "Level of Detail (LOD) expressions allow you to control the level "
              "at which calculations are performed, independent of the visualization.",
            ),

            infoBox(
              "Think of LOD as telling Tableau: 'Calculate this at a specific level, no matter what the chart shows.'",
            ),

            // BASIC EXAMPLE
            sectionTitle("Basic Example"),

            codeBox(
              "{ FIXED [Region] : SUM([Sales]) }",
              "Calculates total sales for each region regardless of filters in the view.",
            ),

            // TYPES
            sectionTitle("Types of LOD Expressions"),

            // FIXED
            codeBox(
              "{ FIXED [Region] : SUM([Sales]) }",
              "FIXED calculates at a fixed level (ignores most filters).",
            ),

            // INCLUDE
            codeBox(
              "{ INCLUDE [Customer Name] : SUM([Sales]) }",
              "INCLUDE adds more detail to the calculation.",
            ),

            // EXCLUDE
            codeBox(
              "{ EXCLUDE [Category] : SUM([Sales]) }",
              "EXCLUDE removes a dimension from the calculation.",
            ),

            // BUSINESS EXAMPLES
            sectionTitle("Business Examples"),

            codeBox(
              "{ FIXED [Region] : SUM([Sales]) }",
              "Find total sales per region even when viewing product-level data.",
            ),

            codeBox(
              "{ INCLUDE [Product] : AVG([Sales]) }",
              "Calculate average sales including product-level detail.",
            ),

            // HEALTHCARE EXAMPLES
            sectionTitle("Healthcare Examples"),

            codeBox(
              "{ FIXED [Hospital] : COUNT([Patient ID]) }",
              "Total patients per hospital regardless of department filters.",
            ),

            codeBox(
              "{ EXCLUDE [Department] : AVG([Age]) }",
              "Average patient age ignoring department breakdown.",
            ),

            // WHY IMPORTANT
            sectionTitle("Why LOD is Important"),

            infoBox(
              "Control calculations independently\n"
              "Create accurate KPIs\n"
              "Handle complex analysis\n"
              "Build advanced dashboards",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "FIXED → fixed level calculation\n"
              "INCLUDE → adds detail\n"
              "EXCLUDE → removes detail\n"
              "Used for advanced analytics",
            ),

          ],
        ),
      ),
    );
  }
}