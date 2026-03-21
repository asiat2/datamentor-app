import 'package:flutter/material.dart';

class PowerBILesson5 extends StatelessWidget {
  const PowerBILesson5({super.key});

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
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget chart(String title, String desc, String example) {
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
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 5 — Creating Visualizations"),
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
              "Visualizations display data using charts and graphs to help "
              "users understand patterns, trends, and insights.",
            ),

            infoBox(
              "Tip: Choosing the right chart is key to telling a clear data story.",
            ),

            // CHARTS
            sectionTitle("Common Power BI Charts"),

            chart(
              "Bar Chart",
              "Used to compare values across categories. Best for showing differences.",
              "Compare number of patients across departments.",
            ),

            chart(
              "Line Chart",
              "Used to show trends over time.",
              "Track monthly revenue or patient visits over time.",
            ),

            chart(
              "Pie Chart",
              "Used to show proportions or percentages.",
              "Show percentage of patients by disease type.",
            ),

            chart(
              "Map",
              "Used to display geographic data.",
              "Show sales or patients by country or city.",
            ),

            chart(
              "Table",
              "Used to display detailed data in rows and columns.",
              "List patient records with age, diagnosis, and visit count.",
            ),

            // REAL USE CASE
            sectionTitle("Real-Life Dashboard Example"),

            explanation(
              "A healthcare dashboard may include:\n"
              "- Bar chart → Patients by department\n"
              "- Line chart → Monthly patient visits\n"
              "- Pie chart → Disease distribution\n"
              "- Map → Patients by location\n"
              "- Table → Detailed patient data",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Bar → Compare categories\n"
              "Line → Show trends over time\n"
              "Pie → Show proportions\n"
              "Map → Show location data\n"
              "Table → Show detailed records",
            ),

          ],
        ),
      ),
    );
  }
}