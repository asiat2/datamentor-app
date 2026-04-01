import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson4 extends StatefulWidget {
  const TableauLesson4({super.key});

  @override
  State<TableauLesson4> createState() => _TableauLesson4State();
}

class _TableauLesson4State extends State<TableauLesson4> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 4 — Creating Charts") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 4 — Creating Charts", true);

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

  Widget chart(String title, String desc, String steps, String example) {
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(desc),
          const SizedBox(height: 5),
          Text("Steps:\n$steps"),
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
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 4 — Creating Charts"),
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
              "Charts are visual representations of data. Tableau allows you "
              "to create charts by dragging fields into Rows and Columns shelves.",
            ),

            infoBox(
              "Tip: Tableau automatically selects a chart type based on the data you drag.",
            ),

            // BAR CHART
            chart(
              "Bar Chart",
              "Used to compare values across categories.",
              "1. Drag 'Category' → Rows\n"
                  "2. Drag 'Sales' → Columns",
              "Compare patient count by department.",
            ),

            // LINE CHART
            chart(
              "Line Chart",
              "Used to show trends over time.",
              "1. Drag 'Date' → Columns\n"
                  "2. Drag 'Sales' → Rows",
              "Track monthly revenue or patient visits.",
            ),

            // PIE CHART
            chart(
              "Pie Chart",
              "Used to show proportions or percentages.",
              "1. Drag 'Category' → Marks (Color)\n"
                  "2. Drag 'Sales' → Angle",
              "Show percentage of diseases.",
            ),

            // MAP
            chart(
              "Map",
              "Used to display geographic data.",
              "1. Drag 'Country/State' → Canvas\n"
                  "2. Drag 'Sales' → Color",
              "Show patient distribution by state.",
            ),

            // SCATTER
            chart(
              "Scatter Plot",
              "Used to show relationship between two variables.",
              "1. Drag 'Sales' → Columns\n"
                  "2. Drag 'Profit' → Rows",
              "Analyze relationship between revenue and cost.",
            ),

            // REAL EXAMPLE
            sectionTitle("Real-Life Example"),

            explanation("Healthcare Dashboard Example:"),

            infoBox(
              "• Bar Chart → Patients by Department\n"
              "• Line Chart → Monthly Visits\n"
              "• Pie Chart → Disease Distribution\n"
              "• Map → Patients by Location\n"
              "• Scatter Plot → Cost vs Treatment Outcome",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Bar → Compare categories\n"
              "Line → Show trends\n"
              "Pie → Show percentages\n"
              "Map → Show location\n"
              "Scatter → Show relationships",
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
