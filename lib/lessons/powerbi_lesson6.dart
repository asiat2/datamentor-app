import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PowerBILesson6 extends StatefulWidget {
  const PowerBILesson6({super.key});

  @override
  State<PowerBILesson6> createState() => _PowerBILesson6State();
}

class _PowerBILesson6State extends State<PowerBILesson6> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 6 — Building Dashboards") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 6 — Building Dashboards", true);

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
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget component(String title, String desc, String example) {
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
        title: const Text("Lesson 6 — Building Dashboards"),
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
              "A dashboard combines multiple visualizations into one view "
              "to summarize key metrics and support decision-making.",
            ),

            infoBox(
              "Tip: A good dashboard answers important business questions quickly.",
            ),

            // COMPONENTS
            sectionTitle("Dashboard Components"),

            component(
              "KPI Cards",
              "Show important numbers at a glance.",
              "Total Revenue = \$500,000",
            ),

            component(
              "Charts",
              "Visualize trends and comparisons.",
              "Bar chart showing sales by region.",
            ),

            component(
              "Tables",
              "Display detailed data records.",
              "List of customers with purchases.",
            ),

            component(
              "Filters / Slicers",
              "Allow users to interact with data.",
              "Filter by year, region, or department.",
            ),

            // HOW TO BUILD
            sectionTitle("How to Build a Dashboard"),

            infoBox(
              "1. Define your goal\n"
              "2. Import and clean data\n"
              "3. Create KPIs\n"
              "4. Add charts\n"
              "5. Add filters\n"
              "6. Arrange layout clearly",
            ),

            // BUSINESS EXAMPLE
            sectionTitle("Business Example"),

            explanation("A sales dashboard may include:"),

            infoBox(
              "• KPI → Total Revenue\n"
              "• Bar Chart → Sales by Region\n"
              "• Line Chart → Monthly Sales Trend\n"
              "• Table → Top Customers\n"
              "• Filter → Year selection",
            ),

            // HEALTHCARE EXAMPLE
            sectionTitle("Healthcare Example"),

            explanation("A hospital dashboard may include:"),

            infoBox(
              "• KPI → Total Patients\n"
              "• Bar Chart → Patients by Department\n"
              "• Line Chart → Monthly Visits\n"
              "• Pie Chart → Disease Distribution\n"
              "• Filter → Age group or Gender",
            ),

            // BEST PRACTICES
            sectionTitle("Best Practices"),

            infoBox(
              "Keep it simple\n"
              "Use clear titles\n"
              "Avoid too many visuals\n"
              "Highlight key insights\n"
              "Make it interactive",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Dashboard = KPIs + Charts + Filters\n"
              "Used for decision-making\n"
              "Combines multiple visuals in one view\n"
              "Essential skill for analysts",
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
