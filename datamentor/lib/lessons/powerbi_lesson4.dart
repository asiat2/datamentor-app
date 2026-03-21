import 'package:flutter/material.dart';

class PowerBILesson4 extends StatelessWidget {
  const PowerBILesson4({super.key});

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

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget step(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(desc),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 4 — Data Cleaning in Power BI"),
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
              "Data cleaning prepares raw data for analysis. Power BI uses "
              "Power Query Editor to clean, transform, and shape data before building reports.",
            ),

            // POWER QUERY IMAGE
            sectionTitle("Power Query Editor"),
            explanation(
              "This is where all data transformation happens before visualization.",
            ),

            Image.asset(
              'assets/images/powerquery.png', // add your image here
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 15),

            infoBox(
              "Tip: Everything you do in Power Query is saved as steps and can be reused automatically.",
            ),

            // COMPONENTS
            sectionTitle("Main Components"),
            explanation(
              "Power Query Editor contains key areas:",
            ),

            step(
              "Queries Pane (Left)",
              "Shows all tables (e.g., DW_Dim_Date, DW_Fact_Visits).",
            ),

            step(
              "Data Preview (Center)",
              "Displays the data table where you clean and transform data.",
            ),

            step(
              "Applied Steps (Right)",
              "Tracks all transformations like filtering, renaming, and type changes.",
            ),

            // CLEANING TASKS
            sectionTitle("Common Data Cleaning Tasks"),

            step(
              "Remove Duplicates",
              "Ensures no repeated rows (Home → Remove Rows → Remove Duplicates).",
            ),

            step(
              "Handle Missing Values",
              "Replace or remove null values using 'Replace Values' or filters.",
            ),

            step(
              "Change Data Types",
              "Convert columns to correct types (e.g., Date, Number, Text).",
            ),

            step(
              "Rename Columns",
              "Make column names clean and readable.",
            ),

            step(
              "Split Columns",
              "Split full names or dates into multiple columns.",
            ),

            // REAL EXAMPLE
            sectionTitle("Real-Life Example"),

            explanation(
              "In your dataset (like DW_Dim_Date), you may:\n"
              "- Convert 'full_date' to Date type\n"
              "- Extract Year, Month, Day\n"
              "- Remove unnecessary columns\n"
              "- Ensure date_key is numeric",
            ),

            // WORKFLOW
            sectionTitle("Step-by-Step Workflow"),

            infoBox(
              "1. Load data into Power BI\n"
              "2. Open Power Query (Transform Data)\n"
              "3. Clean and transform data\n"
              "4. Apply changes\n"
              "5. Build visuals in report",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Power Query = Data Cleaning Engine\n"
              "Everything is saved as steps\n"
              "Clean data = Accurate dashboards\n"
              "Used in all real-world projects",
            ),

          ],
        ),
      ),
    );
  }
}