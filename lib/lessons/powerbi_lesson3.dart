import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PowerBILesson3 extends StatefulWidget {
  const PowerBILesson3({super.key});

  @override
  State<PowerBILesson3> createState() => _PowerBILesson3State();
}

class _PowerBILesson3State extends State<PowerBILesson3> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 3 — Importing Data") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 3 — Importing Data", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        title: const Text("Lesson 3 — Importing Data"),
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
              "Importing data is the first step in Power BI. It allows you to "
              "connect to different data sources like Excel, SQL databases, CSV files, "
              "and cloud platforms.",
            ),

            infoBox(
              "Tip: The quality of your analysis depends on the quality of your data source.",
            ),

            // DATA SOURCES
            sectionTitle("Common Data Sources"),

            step(
              "Excel",
              "Used for business reports, financial data, and healthcare records.",
            ),

            step(
              "CSV Files",
              "Simple text files used for large datasets and system exports.",
            ),

            step(
              "SQL Server",
              "Used for large, structured databases in organizations.",
            ),

            step(
              "Cloud Sources",
              "Includes Azure, SharePoint, and online services.",
            ),

            // STEPS
            sectionTitle("Steps to Import Data"),

            step(
              "Step 1: Click 'Get Data'",
              "Located on the Home ribbon in Power BI.",
            ),

            step(
              "Step 2: Choose Data Source",
              "Select Excel, SQL Server, CSV, or another source.",
            ),

            step(
              "Step 3: Connect to Data",
              "Browse file or enter database credentials.",
            ),

            step(
              "Step 4: Load or Transform",
              "Choose 'Load' to import or 'Transform Data' to clean first.",
            ),

            // EXCEL EXAMPLE
            sectionTitle("Example 1 — Excel Data"),

            explanation(
              "A company imports sales data from Excel to analyze revenue trends.",
            ),

            infoBox(
              "Example:\n"
              "- File: sales.xlsx\n"
              "- Columns: Date, Product, Revenue\n"
              "- Goal: Analyze monthly sales",
            ),

            // SQL EXAMPLE
            sectionTitle("Example 2 — SQL Database"),

            explanation(
              "A hospital connects to a SQL database to analyze patient records.",
            ),

            infoBox(
              "Example:\n"
              "- Table: Patients\n"
              "- Columns: Age, Diagnosis, Visits\n"
              "- Goal: Find most common diseases",
            ),

            // CSV EXAMPLE
            sectionTitle("Example 3 — CSV File"),

            explanation("A dataset exported from a system is loaded as CSV."),

            infoBox(
              "Example:\n"
              "- File: patient_data.csv\n"
              "- Used for quick data analysis\n"
              "- Lightweight and fast to load",
            ),

            // LOAD VS TRANSFORM
            sectionTitle("Load vs Transform"),

            step("Load", "Imports data directly into Power BI."),

            step(
              "Transform Data",
              "Opens Power Query to clean and prepare data before loading.",
            ),

            // WORKFLOW
            sectionTitle("Workflow"),

            infoBox(
              "Get Data → Choose Source → Connect → Transform → Load → Build Dashboard",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Power BI connects to multiple data sources\n"
              "Excel, SQL, and CSV are most common\n"
              "Always clean data before analysis\n"
              "Importing data is the first step in every project",
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
