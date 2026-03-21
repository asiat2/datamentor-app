import 'package:flutter/material.dart';

class TableauLesson10 extends StatelessWidget {
  const TableauLesson10({super.key});

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

  Widget component(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text("• $title: $desc"),
    );
  }

  Widget tipBox(String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text("✔ $title\n$desc"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 10 — Tableau Dashboards"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // DEFINITION
            sectionTitle("Definition"),
            explanation(
              "A dashboard combines multiple charts into one interactive screen "
              "to help users monitor performance and make decisions.",
            ),

            // IMAGE
            sectionTitle("Example Dashboard"),

            Image.asset(
              'assets/images/tableau_dashboard.png',
              fit: BoxFit.contain,
            ),

            infoBox(
              "This Healthcare Dashboard shows KPIs, trends, patient analysis, and revenue performance.",
            ),

            // BREAKDOWN
            sectionTitle("Dashboard Breakdown"),

            component(
              "KPIs (Top)",
              "Revenue, Visits, Avg Length of Stay",
            ),
            component(
              "Patient Demographics",
              "Gender and marital status distribution",
            ),
            component(
              "Department Revenue",
              "Revenue by department and month",
            ),
            component(
              "Map",
              "Geographic healthcare utilization",
            ),
            component(
              "Revenue Trend",
              "Monthly revenue line chart",
            ),
            component(
              "Provider Performance",
              "Doctor/specialty comparison",
            ),
            component(
              "Filters",
              "Department and Year selection",
            ),

            // INSIGHTS
            sectionTitle("Insights You Can Get"),

            infoBox(
              "• Top performing departments\n"
              "• Revenue trends over time\n"
              "• Patient demographics patterns\n"
              "• Geographic utilization\n"
              "• Provider performance comparison",
            ),

            // INTERACTIVITY
            sectionTitle("Interactivity"),

            infoBox(
              "• Click a department → filters dashboard\n"
              "• Adjust year → updates trends\n"
              "• Hover → see detailed values\n"
              "• Click charts → drill down",
            ),

            // ⭐ BEST PRACTICES (NEW SECTION)
            sectionTitle("Best Practices"),

            tipBox(
              "Keep it Simple",
              "Avoid too many charts. Focus on 3–5 key visuals.",
            ),

            tipBox(
              "Use Clear Titles",
              "Always describe what the chart shows clearly.",
            ),

            tipBox(
              "Highlight KPIs",
              "Place important metrics at the top of the dashboard.",
            ),

            tipBox(
              "Use Consistent Colors",
              "Use same color meaning across charts (e.g., green = good).",
            ),

            tipBox(
              "Make It Interactive",
              "Add filters and actions to improve user experience.",
            ),

            tipBox(
              "Design Clean Layout",
              "Align charts properly and maintain spacing.",
            ),

            tipBox(
              "Focus on Insights",
              "Every chart should answer a business question.",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Dashboard = Charts + Filters + Actions\n"
              "Should be simple, clear, and interactive\n"
              "Best dashboards focus on insights, not complexity",
            ),

          ],
        ),
      ),
    );
  }
}