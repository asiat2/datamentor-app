import 'package:flutter/material.dart';

class PowerBILesson2 extends StatelessWidget {
  const PowerBILesson2({super.key});

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(fontSize: 15),
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
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 2 — Power BI Interface"),
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
              "The Power BI interface consists of different panels that help "
              "you load data, create visuals, and build dashboards.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // IMAGE SECTION
            const Text(
              "Power BI Interface",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Image.asset(
              'assets/images/powerbi_interface.png', // make sure image is added
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            infoBox(
              "Tip: Understanding the interface helps you build dashboards faster "
              "and more efficiently.",
            ),

            // COMPONENTS
            const Text(
              "Main Components",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            section(
              "Ribbon",
              "The top menu that contains tools for loading data, transforming data, "
              "and creating calculations. Example: Click 'Get Data' to import Excel or SQL data.",
            ),

            section(
              "Report Canvas",
              "The main workspace where you create visuals. Example: Drag 'Department' "
              "and 'Patients' to create a bar chart.",
            ),

            section(
              "Fields Pane",
              "Displays your tables and columns. Example: Expand a table and drag fields "
              "into visuals.",
            ),

            section(
              "Visualizations Pane",
              "Used to select chart types like bar charts, line charts, and tables. "
              "Example: Choose a bar chart and assign data fields.",
            ),

            section(
              "Filters Pane",
              "Allows you to filter data. Example: Show only patients older than 50.",
            ),

            const SizedBox(height: 20),

            // WORKFLOW
            const Text(
              "How It Works (Workflow)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            infoBox(
              "1. Load Data (Ribbon)\n"
              "2. Select Fields (Fields Pane)\n"
              "3. Choose Visual (Visualizations Pane)\n"
              "4. Build Chart (Canvas)\n"
              "5. Apply Filters (Filters Pane)",
            ),

          ],
        ),
      ),
    );
  }
}