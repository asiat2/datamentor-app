import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PowerBILesson1 extends StatefulWidget {
  const PowerBILesson1({super.key});

  @override
  State<PowerBILesson1> createState() => _PowerBILesson1State();
}

class _PowerBILesson1State extends State<PowerBILesson1> {
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
          prefs.getBool("Lesson 1 — Introduction to Power BI") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 1 — Introduction to Power BI", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 1 — Introduction to Power BI")),

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

            const Text(
              "Power BI is a business intelligence and data visualization "
              "tool developed by Microsoft. It allows users to connect to "
              "different data sources, clean and transform data, analyze "
              "information, and create interactive dashboards and reports.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Why Power BI
            const Text(
              "Why Power BI is Important",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Power BI helps organizations turn raw data into meaningful "
              "insights. Businesses use Power BI to monitor performance, "
              "identify trends, and make data-driven decisions.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Types of Power BI
            const Text(
              "Types of Power BI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            section(
              "Power BI Desktop",
              "Power BI Desktop is a free application installed on your "
                  "computer. It is used to connect to data sources, clean data, "
                  "build data models, and create reports.",
            ),

            section(
              "Power BI Service",
              "Power BI Service is the cloud-based platform where reports "
                  "and dashboards are published and shared with teams through "
                  "a web browser.",
            ),

            section(
              "Power BI Mobile",
              "Power BI Mobile allows users to access dashboards and reports "
                  "from smartphones and tablets. It is useful for managers who "
                  "need insights on the go.",
            ),

            section(
              "Power BI Gateway",
              "Power BI Gateway allows Power BI to securely connect to "
                  "on-premise data sources such as company databases or local "
                  "servers.",
            ),

            const SizedBox(height: 20),

            /// Power Query
            const Text(
              "Power Query",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Power Query is the data preparation tool inside Power BI. "
              "It is used to clean, transform, and shape raw data before "
              "analysis. Power Query allows analysts to remove duplicates, "
              "filter rows, split columns, merge datasets, and change "
              "data formats.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// Example
            const Text(
              "Example Use Case",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "A retail company can import sales data from Excel into "
              "Power BI Desktop, use Power Query to clean the data, "
              "create visual charts showing sales by region, and publish "
              "the dashboard to Power BI Service so managers can monitor "
              "daily performance.",
              style: TextStyle(fontSize: 16),
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
