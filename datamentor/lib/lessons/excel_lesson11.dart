import 'package:flutter/material.dart';

class ExcelLesson11 extends StatelessWidget {
  const ExcelLesson11({super.key});

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height:6),

          Text(description),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 11 — Excel Dashboards"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Definition",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "An Excel dashboard visually displays key metrics, charts, "
              "and summaries in one place to monitor business performance.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Example Dashboard",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale:1,
                maxScale:4,
                child: Image.asset(
                  "assets/images/excel_dashboard.png",
                ),
              ),
            ),

            const SizedBox(height:20),

            section(
              "KPI Metrics",
              "Dashboards display key metrics like Available Agents, "
              "Average Handling Time, and Answered Calls."
            ),

            section(
              "Charts",
              "Charts such as SLA bar charts and CSAT donut charts "
              "help visualize performance trends."
            ),

            section(
              "Agent Performance",
              "Tables summarize agent performance such as inbound calls "
              "and average handling time."
            ),

            section(
              "Business Insight",
              "Managers use dashboards to quickly identify performance "
              "issues and make better decisions."
            ),

          ],
        ),
      ),
    );
  }
}