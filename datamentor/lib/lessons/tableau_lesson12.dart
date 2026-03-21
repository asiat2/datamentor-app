import 'package:flutter/material.dart';

class TableauLesson12 extends StatelessWidget {
  const TableauLesson12({super.key});

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

  Widget tipBox(String title, String desc, String example) {
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
                  fontWeight: FontWeight.bold, fontSize: 16)),
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
        title: const Text("Lesson 12 — Tableau Best Practices"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // INTRO
            sectionTitle("Best Practices"),
            const Text(
              "Best practices help you design dashboards that are clear, "
              "professional, and easy to understand.",
              style: TextStyle(fontSize: 16),
            ),

            // CLEAR TITLES
            tipBox(
              "Use Clear Titles",
              "Always describe what the chart shows.",
              "Instead of 'Sales Chart', use 'Monthly Sales by Region'.",
            ),

            // COLORS
            tipBox(
              "Use Colors Wisely",
              "Avoid too many colors; use consistent color meaning.",
              "Red = Loss, Green = Profit.",
            ),

            // KEEP SIMPLE
            tipBox(
              "Keep Dashboards Simple",
              "Avoid overcrowding with too many visuals.",
              "Use 3–5 key charts instead of 10+.",
            ),

            // FOCUS KPI
            tipBox(
              "Focus on Key Metrics",
              "Highlight the most important numbers (KPIs).",
              "Total Revenue, Profit, Patient Count.",
            ),

            // FILTERS
            tipBox(
              "Use Filters for Interactivity",
              "Allow users to explore data dynamically.",
              "Filter by Year, Region, or Department.",
            ),

            // LAYOUT
            tipBox(
              "Use Clean Layout",
              "Align charts properly and maintain spacing.",
              "Place KPIs at the top, charts below.",
            ),

            // CONSISTENCY
            tipBox(
              "Maintain Consistency",
              "Use same fonts, colors, and formatting across dashboard.",
              "All charts use same color scheme.",
            ),

            // REAL EXAMPLES
            sectionTitle("Real-Life Examples"),

            infoBox(
              "Business Dashboard:\n"
              "• KPI → Revenue at top\n"
              "• Bar Chart → Sales by Region\n"
              "• Line Chart → Monthly Trend\n"
              "• Filter → Year\n",
            ),

            infoBox(
              "Healthcare Dashboard:\n"
              "• KPI → Total Patients\n"
              "• Bar Chart → Patients by Department\n"
              "• Pie Chart → Disease Distribution\n"
              "• Filter → Age Group\n",
            ),

            // DO VS DON'T
            sectionTitle("Do vs Don't"),

            infoBox(
              "DO:\n"
              "✔ Keep it simple\n"
              "✔ Highlight insights\n"
              "✔ Use clear labels\n\n"
              "DON'T:\n"
              "✘ Use too many colors\n"
              "✘ Overcrowd dashboard\n"
              "✘ Confuse users",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Clear → Simple → Insightful\n"
              "Focus on key metrics\n"
              "Use consistent design\n"
              "Make dashboards interactive",
            ),

          ],
        ),
      ),
    );
  }
}