import 'package:flutter/material.dart';

class TableauLesson3 extends StatelessWidget {
  const TableauLesson3({super.key});

  Widget section(String title, String desc, String example) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(desc),
          const SizedBox(height: 5),
          Text(
            "Example: $example",
            style: const TextStyle(fontStyle: FontStyle.italic),
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
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 3 — Tableau Interface"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // DEFINITION
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "The Tableau interface contains different panels used to build "
              "charts and dashboards. Understanding these components helps you "
              "create visualizations quickly and efficiently.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // IMAGE
            const Text(
              "Tableau Interface",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Image.asset(
              'assets/images/tableau_ui.png', // add your image
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 15),

            infoBox(
              "Tip: Tableau works by dragging fields into Rows, Columns, and Marks to create visuals.",
            ),

            // COMPONENTS
            const Text(
              "Main Components",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // DATA PANE
            section(
              "Data Pane",
              "Located on the left side. It shows your dataset fields divided into Dimensions and Measures.",
              "Drag 'Department Name' to create categories and 'Patient Count' for analysis.",
            ),

            // SHELVES
            section(
              "Rows & Columns Shelves",
              "Control how data is displayed in the chart. Rows = vertical axis, Columns = horizontal axis.",
              "Drag 'Month' to Columns and 'Revenue' to Rows to create a trend chart.",
            ),

            // MARKS CARD
            section(
              "Marks Card",
              "Controls how the chart looks (color, size, label, tooltip).",
              "Drag 'Department' to Color to show different colors per department.",
            ),

            // FILTERS
            section(
              "Filters Shelf",
              "Used to filter data and control what is displayed.",
              "Filter patients where Age > 50.",
            ),

            // CANVAS
            section(
              "Worksheet Canvas",
              "The main area where your visualization appears.",
              "Your bar chart or line chart is displayed here.",
            ),

            // WORKFLOW
            const SizedBox(height: 20),

            const Text(
              "How Tableau Works (Workflow)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            infoBox(
              "1. Connect to data\n"
              "2. Drag fields from Data Pane\n"
              "3. Place on Rows/Columns\n"
              "4. Customize using Marks\n"
              "5. Add filters and build dashboard",
            ),

            // REAL EXAMPLE
            const SizedBox(height: 20),

            const Text(
              "Real-Life Example (Healthcare)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            infoBox(
              "• Drag 'Department' → Rows\n"
              "• Drag 'Patient Count' → Columns\n"
              "• Add 'Month' → Filters\n"
              "• Result: Patients per department dashboard",
            ),

          ],
        ),
      ),
    );
  }
}