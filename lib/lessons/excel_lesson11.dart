import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExcelLesson11 extends StatefulWidget {
  const ExcelLesson11({super.key});

  @override
  State<ExcelLesson11> createState() => _ExcelLesson11State();
}

class _ExcelLesson11State extends State<ExcelLesson11> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 11 — Excel Dashboards") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 11 — Excel Dashboards", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(description),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 11 — Excel Dashboards")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "An Excel dashboard visually displays key metrics, charts, "
              "and summaries in one place to monitor business performance.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Example Dashboard",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset("assets/images/excel_dashboard.png"),
              ),
            ),

            const SizedBox(height: 20),

            section(
              "KPI Metrics",
              "Dashboards display key metrics like Available Agents, "
                  "Average Handling Time, and Answered Calls.",
            ),

            section(
              "Charts",
              "Charts such as SLA bar charts and CSAT donut charts "
                  "help visualize performance trends.",
            ),

            section(
              "Agent Performance",
              "Tables summarize agent performance such as inbound calls "
                  "and average handling time.",
            ),

            section(
              "Business Insight",
              "Managers use dashboards to quickly identify performance "
                  "issues and make better decisions.",
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
